#!/usr/bin/env python3
"""Local MOCK of the Supabase endpoints the website uses. It imitates the project's RLS rules
(owner-only writes, anonymous read of gallery/site tables, anonymous INSERT-ONLY into voice/ch5|ch10).
It is NOT Supabase: it only proves the website's client logic. Never a substitute for the live test."""
import json, sys, threading, time, urllib.parse, re
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
OWNER_EMAIL, OWNER_PW, OWNER_TOK = 'owner@example.test', 'test-password', 'owner-token'
ALLOWED_VOICE = re.compile(r'^(audio/(webm|ogg|opus|mp4|mpeg|mp3|x-m4a|m4a|mp4a-latm|aac|wav|x-wav|wave|3gpp|3gpp2|amr|flac)|video/(webm|mp4))$')
S = {'gallery_state': {'rev': 0, 'data': {'v': 2, 'items': []}}, 'site_settings': {'rev': 0, 'data': {}},
     'files': {}, 'log': [], 'offline': False, 'fail_upload': False}
L = threading.Lock()
class H(BaseHTTPRequestHandler):
    protocol_version = 'HTTP/1.1'
    def log_message(self, *a): pass
    def cors(self):
        self.send_header('Access-Control-Allow-Origin', '*'); self.send_header('Access-Control-Allow-Headers', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET,POST,PATCH,DELETE,HEAD,OPTIONS'); self.send_header('Access-Control-Expose-Headers', 'content-length,content-type')
    def out(self, code, body=b'', ctype='application/json', extra=None):
        if isinstance(body, (dict, list)): body = json.dumps(body).encode()
        self.send_response(code); self.cors(); self.send_header('Content-Type', ctype); self.send_header('Content-Length', str(len(body)))
        self.send_header('Cache-Control', 'no-store')
        for k, v in (extra or {}).items(): self.send_header(k, v)
        self.end_headers()
        if self.command != 'HEAD': self.wfile.write(body)
    def is_owner(self): return self.headers.get('Authorization', '') == 'Bearer ' + OWNER_TOK
    def body(self):
        n = int(self.headers.get('Content-Length', 0) or 0); return self.rfile.read(n) if n else b''
    def do_OPTIONS(self): self.out(204)
    def route(self):
        u = urllib.parse.urlparse(self.path); q = urllib.parse.parse_qs(u.query); p = urllib.parse.unquote(u.path); m = self.command
        with L: S['log'].append((m, p, 'owner' if self.is_owner() else 'anon'))
        if p == '/__ctl':   # test control
            c = json.loads(self.body() or b'{}')
            with L:
                for k in ('offline', 'fail_upload'):
                    if k in c: S[k] = c[k]
                if c.get('reset'): S.update({'gallery_state': {'rev': 0, 'data': {'v': 2, 'items': []}}, 'site_settings': {'rev': 0, 'data': {}}, 'files': {}, 'log': []})
            return self.out(200, {'ok': 1})
        if p == '/__state':
            with L: return self.out(200, {'gallery': S['gallery_state'], 'site': S['site_settings'], 'files': {k: [v[1], len(v[0])] for k, v in S['files'].items()}, 'log': S['log']})
        if S['offline']: return self.out(503, {'message': 'mock offline'})
        if p == '/auth/v1/token':
            b = json.loads(self.body() or b'{}')
            if q.get('grant_type') == ['password']:
                if b.get('email') == OWNER_EMAIL and b.get('password') == OWNER_PW:
                    return self.out(200, {'access_token': OWNER_TOK, 'refresh_token': 'rt1', 'expires_in': 3600, 'user': {'email': OWNER_EMAIL}})
                return self.out(400, {'error_description': 'Invalid login credentials'})
            if b.get('refresh_token') == 'rt1': return self.out(200, {'access_token': OWNER_TOK, 'refresh_token': 'rt1', 'expires_in': 3600, 'user': {'email': OWNER_EMAIL}})
            return self.out(400, {'error_description': 'bad refresh'})
        mm = re.match(r'^/rest/v1/(gallery_state|site_settings)$', p)
        if mm:
            t = mm.group(1)
            if m == 'GET':
                with L: return self.out(200, [dict(S[t], id=1)])
            if m == 'PATCH':
                if not self.is_owner(): return self.out(200, [])   # RLS: 0 rows updated
                b = json.loads(self.body()); want = int(q.get('rev', ['-1'])[0].replace('eq.', '')) if 'rev' in q else None
                with L:
                    if want is not None and S[t]['rev'] != want: return self.out(200, [])
                    S[t] = {'rev': b['rev'], 'data': b['data']}; return self.out(200, [dict(S[t], id=1)])
        mm = re.match(r'^/storage/v1/object/public/([^/]+)/(.+)$', p)
        if mm and m in ('GET', 'HEAD'):
            b, k = mm.groups()
            if b != 'gallery': return self.out(400, {'message': 'Bucket not found'})
            with L: f = S['files'].get(b + '/' + k)
            if not f: return self.out(404, {'message': 'not found'})
            return self.out(200, f[0], f[1])
        mm = re.match(r'^/storage/v1/object/list/voice$', p)
        if mm and m == 'POST':
            if not self.is_owner(): return self.out(200, [])  # RLS hides rows
            pre = json.loads(self.body()).get('prefix', '')
            with L: return self.out(200, [{'name': k[len('voice/' + pre):], 'id': 'x', 'created_at': '2026-10-22T0%d:00:00Z' % (i % 9)} for i, k in enumerate(S['files']) if k.startswith('voice/' + pre)])
        mm = re.match(r'^/storage/v1/object/sign/voice/(.+)$', p)
        if mm and m == 'POST':
            if not self.is_owner(): return self.out(400, {'message': 'Object not found'})
            return self.out(200, {'signedURL': '/object/sign/voice/' + mm.group(1) + '?token=tok'})
        if mm and m == 'GET':
            with L: f = S['files'].get('voice/' + mm.group(1))
            return self.out(200, f[0], f[1]) if f and q.get('token') else self.out(400, {'message': 'bad token'})
        mm = re.match(r'^/storage/v1/object/([^/]+)/(.+)$', p)
        if mm and m == 'POST':
            b, k = mm.groups(); data = self.body(); ct = self.headers.get('Content-Type', '')
            if S['fail_upload']: return self.out(500, {'message': 'mock storage failure'})
            folder = k.split('/')[0]
            if b == 'gallery' and not (self.is_owner() and folder in ('photos', 'videos', 'site')): return self.out(403, {'message': 'new row violates row-level security policy'})
            if b == 'voice':
                if folder not in ('ch5', 'ch10'): return self.out(403, {'message': 'new row violates row-level security policy'})
                if not ALLOWED_VOICE.match(ct.split(';')[0]): return self.out(415, {'message': 'mime type ' + ct + ' is not supported'})
                if len(data) > 10485760: return self.out(413, {'message': 'The object exceeded the maximum allowed size'})
            if b not in ('gallery', 'voice'): return self.out(404, {'message': 'Bucket not found'})
            with L:
                if b + '/' + k in S['files']: return self.out(400, {'message': 'The resource already exists'})
                S['files'][b + '/' + k] = (data, ct)
            return self.out(200, {'Key': b + '/' + k})
        if mm and m == 'DELETE':
            b, k = mm.groups()
            if not self.is_owner(): return self.out(200, [])
            with L: ex = S['files'].pop(b + '/' + k, None)
            return self.out(200, [{'name': k}] if ex else [])
        self.out(404, {'message': 'mock: no route ' + m + ' ' + p})
    do_GET = do_POST = do_PATCH = do_DELETE = do_HEAD = route
if __name__ == '__main__':
    ThreadingHTTPServer(('127.0.0.1', int(sys.argv[1]) if len(sys.argv) > 1 else 54321), H).serve_forever()
