ANUSHA'S BIRTHDAY FILM - v12 (10 chapters + hidden voice challenge)
OPEN: unzip, double-click index.html (phone: open from Files with Chrome).
ORDER (each unlocks the next): 1 Welcome, 2 Birthday Garden, 3 Dream House, 4 Cut the Cake, 5 Love Game, 6 Photo Memories, 7 Romeo & Juliet, 8 A Life Begins (24 October 2011), 9 Final Birthday Wish, 10 The Last Surprise (scratch the screen, an egg flies in automatically, splats and drips, then wipe it clean; unlocks only after the Final Wish surprise is opened). HIDDEN: if the matching game takes MORE than 30 moves, a voice-note challenge appears before the next lock.
Progress is saved in the browser. "Start over" is on the welcome screen.
PHOTOS: already inside /photos (final.jpg, garden.jpg, story.jpg, photo1.jpg, photo2.jpg). Replace a file with the same name to swap a picture. photo3-photo6.jpg appear automatically in Memories if added.
  Captions: search "var GAL=" (Memories) and "figcaption" (other chapters) in index.html. On the Memories page, "Edit photos and captions" gives temporary previews only.
AUDIO (optional, put in /audio): music.mp3 = background music; first-cry.mp3 = real newborn cry for the film. Without them the site uses built-in generated sound. Use only audio you own or are licensed to use.
TEXT: all writing is plain text in index.html - search for a phrase and edit it.
PUBLISH: upload the whole folder (keep photos and audio) to Netlify Drop, GitHub Pages or Cloudflare Pages, then share the link.

VOICE NOTE: needs a microphone and https (Netlify/GitHub Pages) or localhost; some browsers block the mic on file://. The recording is kept in memory only; use Download Voice Note (Anusha_Love_Voice_Note.webm/.m4a) to keep it. Nothing is uploaded.
CHILDHOOD PHOTO: photos/childhood.jpg is shown inside the film (Where It All Began) after the 24 October 2011 reveal. Swap the file to change it. The caption is neutral on purpose: no age or year is claimed.

EGG SURPRISE: the splat now covers the whole screen (fixed overlay above the page). Toolbar at the top: Clean Screen, Replay, Back to Birthday, Mute. GALLERY: tap any photo for the large viewer (arrows or Esc). The five photos in /photos are the ones you sent.

DREAM HOUSE: real 3D (hand-written WebGL, no library). Drag to turn, pinch or scroll to zoom, Peek inside shows a decorated room. If a phone has no WebGL the old flat drawing is used instead.
CAKE: two cuts (down, then across) make four separate pieces with chocolate layers and drips. 'Guide my hand' does the cuts automatically.
LOCKS: no skip buttons remain. Progress is stored in this browser's localStorage, so a technical visitor could edit it; it cannot be made tamper-proof without a server.
v13 CHANGES: (1) Voice challenge hardened: clear https/file:// explanation, no-mic/busy-mic/denied messages, silence detection, 30s auto-stop, start/stop tones, redo, explicit confirm. Tested with Chrome fake microphone: record, stop, play, redo, confirm unlocked only after confirm. (2) Growth film rebuilt as a canvas animation (shaded cartoon characters, continuous age 0 to 15, 7 scenes, camera moves, generated sounds). The standalone photo was removed from the film. Ends on 24 October 2026, age 15 (computed from birth date).
NOT DONE in v13: funny 'Catch Your Bhut' game, Romeo & Juliet rewrite, 3D house upgrade, full sound map (cake, egg, house sounds are unchanged), real-phone testing. The film is 2D shaded canvas, not true 3D.

=== v14 NOTES (simple English) ===
OPEN: unzip the WHOLE folder; keep index.html, photos/ and audio/ together. Double-click index.html, or (better, needed for the microphone) upload the folder to Netlify Drop / GitHub Pages and open the https link in Chrome.
MICROPHONE: browsers allow the mic only on https or localhost. If you see 'permission blocked': Chrome > lock/tune icon next to the address > Permissions > Microphone > Allow > reload. If the mic still cannot be used, the voice challenge has a button 'Record with phone recorder' that opens the phone's own recorder app (works anywhere). The chapter unlocks only after a valid recording is chosen AND 'Keep it & Continue' is tapped. Nothing is uploaded.
PHOTOS: all 6 photos in photos/ now show in Memories (they are also embedded inside index.html as a safety copy, so they appear even if the folder is missing). 'Add photos from my device' makes temporary previews only (lost on reload). To keep photos: copy files into photos/ and edit the GAL list in index.html.
FILM: every scene now has a title and poem in a caption panel under the picture. Characters are shaded 2D canvas cartoons, not true 3D.
SOUND (honest): no audio files could be downloaded here, so the baby cry, applause and Happy Birthday are SYNTHESISED in the browser (instrumental, no vocals). For real recordings put these in audio/: first-cry.mp3 (used automatically). Use only recordings you have the licence for; none are bundled.
NOT DONE: Catch Your Bhut game, Romeo & Juliet rewrite, 3D house upgrade, cake/egg/house sound polish, real-phone tests.

=== v15 NOTES ===
CHAPTER 6 is now 'Catch Your Heart' (the photo gallery and its description cards were removed; photo files are kept in photos/). Catch the moving heart 8 times; it speeds up gradually; winning unlocks Romeo & Juliet. Works with touch and mouse.
PHOTOS: shown ONLY in the Final Birthday Wish, one at a time with Previous/Next, no captions. Order: final, garden, photo1, photo2, story, childhood. Edit the WP list in index.html to change it.
HAIR: the girl and the parents now have drawn hair with a parting, strands and length instead of a dark cap. Bodies are still stylised 2D canvas cartoons, NOT realistic or 3D.
AUDIO (honest): newborn cry, applause and Happy Birthday are still SYNTHESISED in the browser (instrumental). No licensed recordings could be downloaded here, so nothing in audio/ is bundled. To use real ones, add audio/first-cry.mp3 (auto-used). Use only recordings you have the right to use and note their source here.
STILL NOT DONE: realistic/3D human characters, upgraded 3D house, Romeo & Juliet rewrite, real recordings, real-phone tests.


=== v16 NOTES (what changed, and what did NOT) ===
DONE
- FINAL WISH: exactly one real photograph, photos/final.jpg (the only upright, clear portrait among the six supplied), inside a gold frame with three hand-drawn SVG roses at the corners (none over the face), a string of fairy lights above, and a slow fade-in. The photo grid and Previous/Next buttons are gone. To use another picture, replace photos/final.jpg (a copy is also embedded in index.html, so edit the PH list too if you want a different embedded fallback).
- WISH TEXT: new original message. Search for "Some people arrive in a life" in index.html. It contains no invented facts beyond the birth date 24 October 2011 you supplied.
- HAPPY BIRTHDAY SONG: a play/pause button now sits under the photo. It plays audio/happy-birthday.mp3 if you add that file, starts after the gift is tapped (a user gesture), and resumes instead of restarting. If the file is missing, the button plays a short synthesised instrumental and says so on screen.
- APPLAUSE: plays audio/applause.mp3 if present, otherwise the old synthesised clap.
- MUTE: new "Mute all" button in the bottom bar silences every sound and music. Missing audio files cannot crash the page (tested).
- Tested with automated Chromium (Playwright) at 390x844 and 1280x800: final wish loads, photo displays (720 px wide), no JavaScript errors, Mute all toggles.
NOT DONE (honest)
- No audio recordings exist in this project and this environment has no internet access, so NO real newborn cry, applause or Happy Birthday vocal is bundled. Add: audio/first-cry.mp3, audio/applause.mp3, audio/happy-birthday.mp3, audio/music.mp3 (only recordings you own or are licensed to use).
- The life-journey film is STILL a 2D shaded canvas animation. Realistic 3D humans need rigged character models and hair assets that cannot be created or downloaded here. Nothing in this version claims otherwise.
- Garden, dream-house, cake and Catch Your Heart flowers were NOT redesigned in v16; only the final-wish roses are new.
- Full text proofreading of every chapter was not completed. Real Android phone testing was not done.


=== v17 NOTES ===
DONE AND TESTED (automated Chromium with a fake microphone, served from localhost, phone-sized 390x844 viewport)
- RECORD MY BIRTHDAY MESSAGE: on the Welcome page, open "Before you share this: record my birthday message". Press Record (the browser asks for microphone permission), Stop, listen with the player, Save for the final wish, Delete, or Record again. Recordings under 1 second or empty are rejected with a message and cannot be saved. Recording never starts by itself. Nothing is uploaded.
- STORAGE: the saved message lives in this browser's IndexedDB, so it survives a reload but does NOT transfer to another phone or browser, and may be lost if site data is cleared or in private browsing. Record it in the same browser Anusha will use, or on the published link she will open.
- FINAL WISH: after the gift is opened, your saved voice plays once (music is lowered while it plays), with a Play/Pause button and a voice-volume slider. If no voice is saved, the Happy Birthday button works as before. Mute all silences the voice too.
- MICROPHONE REQUIREMENTS: browsers allow the microphone only on https:// or localhost. Publish the folder to Netlify Drop or GitHub Pages and open the https link, or run "python3 -m http.server 8000" in the folder and open http://localhost:8000. On Android Chrome, if blocked: lock icon beside the address > Permissions > Microphone > Allow, then reload; also check Settings > Apps > Chrome > Permissions.
- FILM CAPTIONS: all ten rewritten with new original text and titles (search "var SC=1.5").
- FINAL WISH TEXT: fully rewritten (search "Today I get to celebrate"). Signature unchanged: Forever yours, her Bhut👻
- ANUSHA'S PHOTO: one photo, photos/final.jpg, replace the file to change it.
NOT DONE (honest)
- The film characters are STILL 2D canvas cartoons. I did not rebuild them; realistic or well-drawn human characters need rigged 3D models or professional artwork that I cannot create or obtain here.
- The dream house was not rebuilt, and garden, house, cake and game flowers were not redesigned (only the final-wish roses from v16).
- No real newborn-cry, applause or Happy Birthday recordings are included (no internet here). Add audio/first-cry.mp3, applause.mp3, happy-birthday.mp3, music.mp3.
- Chapter locks, Catch Your Heart, cake cutting and the egg surprise were not re-audited in this version. A full proofreading pass of every chapter was not done. Nothing was tested on a real Android phone.


=== v18 NOTES: THREE NEW GAMES (honest status) ===
OPEN: "🎮 Bonus Games" on the Welcome page, or "🎮 Games" in the bottom bar of any chapter. Games are bonus content and never change chapter locks. Back returns to the story. All earlier chapters are untouched.
1) Mission: Anusha-r Hasi Churi - 5 levels (number pattern, 3-digit logic code, name riddle, 7x7 maze with buttons/swipe/arrow keys, final 4-digit code). Answers are typed, so random tapping cannot win. 5 hints (-75 points each), wrong answer -25. Later levels are locked until earlier ones are solved. Progress is saved in localStorage ("anushaG1"). Victory shows heart, confetti, jingle. Reset and Play again included.
2) Cake Disaster Bakery - 4 icings, 10 toppings (3 silly ones), tap or drag on the cake, Undo, "Show my cake!" gives a score out of 100 with stars, Replay.
3) Cupid-er Aim Kothay? - a sweeping aim marker, SHOOT button (or tap the canvas / Space), moving hearts and rose decoys that speed up, 45 s timer, combo bonus, score target 120, own mute button plus the site's Mute all.
Bangla dialogue: random pools per game state, never the same line twice in a row, shown in one box per game above the controls.
TESTING DONE: JavaScript syntax check passed; the maze was checked by program to be solvable.
NOT DONE / NOT TESTED: no browser, phone-sized or Android test was run; touch, layout, Bangla font rendering and sound were not verified. Dialogue pools are short (2-3 lines per state). Bangla lines were not proofread by a native reader. The older games (Catch Your Heart, love game, cake cutting) were NOT given new Bangla dialogue. Please play every game once on your phone before sharing.


=== v19 BUG-FIX REPORT ===
BUGS FOUND (by running the site in headless Chromium at 390x844, touch enabled)
1. NEW GAMES NEVER RAN (my v18 mistake): the games code sat outside the site's private script scope, so $, tone, MUTE, confetti were undefined and the whole block crashed on its first line. Fixed: code moved inside the scope.
2. ID COLLISION: game sections used ids g1/g2/g3, which the cake-cutting SVG already uses, so Mission rendered at 0x0 and its input could not be used. Fixed: renamed to gm1/gm2/gm3; no duplicate ids remain.
3. CAKE PIECES only slid sideways. Now, after the second cut, all four pieces drop from above, land with two bounces and a thud, with crumbs. Restart restores four pieces.
4. CATCH YOUR HEART was slow (1.5 s first move, sliding 0.45 s so taps hit moving targets) and its text was romanised. Now: faster start, speeds up each catch, random jumps away from the last spot, bigger hit area, timer, Bangla dialogue pools for hits, mid-game, last catch, misses, repeated misses, win and replay (never the same line twice in a row), 120 ms debounce against double taps.
5. MICROPHONE messages were generic. Now each cause is reported separately: content:// preview, file://, insecure http address, missing getUserMedia, Permissions Policy block from an embedding app or iframe, permission state "denied" vs "granted but refused" (using navigator.permissions), no microphone, microphone busy, unsupported MediaRecorder, empty or too-short recording. Applied to both the Welcome-page recorder and the hidden voice challenge. Button renamed "Confirm voice".
6. DETACHED LEGS: the parents' legs stopped at the torso edge. Legs now run into a pelvis, shoes sit on the ground at the ankles, arms start inside the shoulder line; the girl's feet now follow the leg ends.
TESTED IN HEADLESS CHROMIUM (fake microphone, phone viewport 390x844, touch taps): all 10 chapters open with no console errors and no sideways overflow; Mission (wrong answer, locked levels, all 5 levels incl. maze, victory, replay); Cake Disaster Bakery (select, place, undo, score, replay); Cupid (start, shoot, timer, score, mute); Catch Your Heart (miss lines, 8 catches, win, unlock, replay); cake cutting (Guide my hand, 4 pieces, Restart); egg scratch; film plays; voice: record with timer, stop, playback, record again, confirm, survives reload, delete, saved voice plays on the final wish (a blob audio play() was observed); insecure-address message shown on a non-https IP.
NOT TESTED / NOT DONE (honest)
- NO real Android phone and no real microphone were used. Android microphone success is unverified. A content:// preview cannot record; use https (Netlify Drop / GitHub Pages) or localhost.
- NOT DONE: realistic human characters (they are still stylised 2D canvas cartoons with large eyes; this needs professional artwork or 3D models), and the rebuilt detailed 3D house, roses, trees and furnished interior (the house is still the earlier simple WebGL model). The final-wish text was not rewritten.
- The older love game, voice challenge, house and Romeo & Juliet chapters were opened and clicked through for errors but not given new Bangla dialogue. Bangla lines were not proofread by a native reader.
- Audio files (music.mp3 etc.) are not bundled; the 404s in the console are those optional files and the site falls back to generated sound.


=== v20 NOTES (what was checked and changed this round) ===
FOUND IN THE PROJECT AND TESTED: Cake Disaster Bakery is a real WebGL 3D scene (rotate, zoom, add/remove layers, cream strokes that follow the cake surface, name text on the top, strawberry/cherry/candle/chocolate/sprinkles, eraser, undo, reset, score reveal). Mission's final level is a "Heart Vault": a 4-digit code with five linked clues using the Level 2 and Level 3 answers, 3 progressive hints (each costs a hint and 75 points). I solved it by hand: the only solution is 4763.
CHANGED THIS ROUND:
1. Cream drips used to hang forever. A drip that reached its length limit now releases a droplet that falls under gravity (speed increases), lands on the plate, flattens into a splat and increases the "Drips landed" counter. Verified: heavy cream on one spot gave 3 landed drips within 6 seconds.
2. Bangla comedy removed from Catch Your Heart (start text and win text are now plain English); the Bangla comedy now lives only in the three games. The film's only Bangla line is the birth-scene line you gave (checked: it appears once, nowhere else outside the games).
3. Added a few more funny lines to Cupid-er Aim Kothay? (hits and misses).
TESTED (headless Chromium, 390x844 touch, software WebGL): 3D cake drip/land, decoration/name staying attached after rotating, undo, layer removal, reset, reveal; Mission incl. wrong final answer, hint 1 and 2, correct 4763, victory, replay; Cupid shoot/score/timer/mute; Catch Your Heart 8 catches and win; cake cutting still splits into four pieces; no page errors.
NOT DONE: new realistic human characters; a rebuilt, detailed 3D dream house with roses, trees and furnished interior; the cake's cream is a bead-chain (spheres) approximation, not fluid simulation. These were not attempted this round, so the house and characters are unchanged from v19. Not tested on a real Android phone or real GPU.

=== V21 NOTES ===
CAKE DISASTER BAKERY: new lighting, gold cake board, cream bands and scalloped borders on every layer, piped rosettes and a cherry on top, gold pearls. All are drawn in cake space so they stay attached while rotating.
DREAM HOUSE: rose bushes with stems, layered petals and leaves along the path, garden lamps, fairy-light garlands, fallen petals; interior now has a rug, curtains, bunting, balloons, a birthday cake on the table, a rose vase and a floor lamp.
FILM: characters now use a proper two-joint leg and arm rig with knees, shoes, neck and shoulders, so legs no longer disappear. Still stylised 2D canvas art, not true 3D or photorealistic.
CATCH YOUR HEART messages are English only (checked).
NOT VERIFIED: real Android phone, microphone on a real device, sound by ear. Voice code unchanged from V20 (has phone-recorder fallback).

=== V22 NOTES ===
FILM: four short Bangla lines shown once each in a dialogue line under the picture (birth scene, early childhood, growing up, before the 2026 reveal). Captions unchanged.
CAKE DISASTER BAKERY: cream painted by drag stays attached when rotating; cream near the side or top rim now spawns drips that fall under gravity, extend, release droplets and land (a lightweight approximation, not a fluid simulation). Rotate/zoom, layers, undo, reset were already present. Reset also acts as replay.
HOUSE: Peek inside shows a framed photo of Anusha (photos/final.jpg, embedded copy used if the file is missing) on the back wall and a glowing 'I Love You, Anusha' sign on the right wall (real textured WebGL quads). The line 'Some love stories are rare because some souls are impossible to replace.' fades in at the top the first time you peek inside and when you press Finish My Little House. The house has no numbered levels, so those two moments act as the 'new level' triggers.
Voice challenge: untouched.
NOT DONE/UNTESTED: parents are still static standing figures; real phone; sound by ear; cake-cutting game and Mission games not re-tested.


=== V23 REPORT ===
CHANGED
1. FILM: the birth-scene Bangla line was appended to the English description AND shown as a separate dialogue (the duplicate). Removed from the description. The four approved Bangla lines now appear once each, in the dialogue strip only: birth, early childhood ("এই ছোট্ট মানুষটাই…" was swapped with the growing-up line; fixed), growing up, and before the 2026 reveal. Caption card height and dialogue strip spacing tightened for phone screens. Characters were redrawn as jointed figures (neck, shoulders, tapered thighs and shins meeting at knees and a pelvis, hands, shoes with ground shadow, smaller natural eyes, brows, nose, lips, hair). Birth scene: father now walks in, mother cradles the baby, baby has closed eyes and a swaddle, bed replaces the old blob. The characters are still 2D drawings, NOT photorealistic or 3D.
2. HOUSE: new detailed WebGL model (shingled roof, chimney, framed windows with shutters, panelled door, porch, steps, picket fence, stepping stones, raised flowerbeds with layered-petal roses, shaped trees, shrubs, lamp post, bench, per-fragment fog, sky gradient). Interior now has bed, bedside lamp, sofa, rug, bookshelf, curtains, fairy lights, plant, flowers, windows. The gold frame now shows photos/photo2.jpg (a different genuine Anusha photo with her name watermark, rotated upright) instead of final.jpg; final.jpg is still used by the final wish. The glowing "I Love You, Anusha ♡" sign and the rare-love message are unchanged and fixed in world space, so they stay in place while the house rotates. All house options still work.
3. CAKE DISASTER BAKERY: kept the V22 cake-making game (layers add/remove, cream painting, drips that extend and release droplets that fall and land, piping pearls, cherries, text on top, zoom, rotate, undo, reset, replay). No rebuild this round; only the jokes were wired in. Cream is a bead/sphere approximation with simple gravity, not a fluid simulation. The separate cake-cutting game was not touched.
4. JOKES (Banglish) added only to Mission, Catch Your Heart, Cupid-er Aim Kothay?, Cake Disaster Bakery and Build a House, at the events you listed. Cupid now detects "near miss" when an arrow passes close beside a heart. House events map to option choices because the house has no drag-and-drop placement: clashing colours (e.g. same-family roof and door, pink wall with pink roof) or an empty garden counts as "failed choice"; any other choice counts as "success".
TESTED (headless Chromium with software WebGL, mobile 390x844 touch and desktop 1280x800)
- Film played end to end: exactly four Bangla lines shown, once each, no Bangla inside English captions; screenshots of birth, early childhood, growing-up and 2025 scenes checked for layout.
- House: outside and inside views in Cottage, Tall and Wide; photo and sign visible; all 31 option chips tapped with no errors; start/fail/success/finish jokes seen.
- Cake game: layer +/-, cream painting, drips landing (6 landed in 5 s), decorations, name, rotate, zoom, undo, reveal, reset; jokes for start, failed placement, success and completion seen.
- Mission, Catch, Cupid: full runs to victory; every listed joke event produced its line (Cupid near-miss included).
- All chapters open with no console errors and no sideways overflow on both viewports; final wish opens.
NOT TESTED / REMAINING
- No real Android phone, real GPU or real microphone. Frame rate on phones is unmeasured.
- The Voice Challenge was not modified and not re-tested this round.
- Not every random joke variant was observed in one run (lines are random; each pool was only partly sampled).
- Characters still look stylised; hands and walking poses are improved but not perfect (arms sit close to the body in some scenes).
- House interior: furniture is geometric models, not detailed textures; no drag-and-drop furniture placement.
- Spelling of the Banglish lines is exactly as you supplied them.

=== v24 NOTES ===
Changed: adult men now get short hair/broader shoulders (father no longer drawn with long hair); mother has auburn hair; birth scene recomposed (father enters and stands inside the frame, baby is a swaddled bundle held at the mother's chest with a smaller head and closed eyes); cake: varied piped scallop border, filling bands between layers, alternating-colour top rosettes, sparse mixed gold/pink dots instead of rings of identical beads; cake loop pauses when the tab is hidden.
Tested (headless Chromium 390x844, software WebGL): birth scene screenshots; film caption (English) and Bangla line appear once each in separate boxes; cake game cream painting (12 items), cherry, layer +/-, undo, reset: no JS errors.
NOT fixed / not verified: parents' arms still look long and thin in the birth scene; ages after birth not re-reviewed; cake is still low-poly cylinders (no real sponge texture, drips seen only by code reading, not observed falling); house/film lag not profiled or changed beyond the cake tab-hidden pause; no real-device test; Voice Challenge untouched; screenshots from you were not attached, only the text brief.

=== v25 NOTES ===
Cake Disaster Bakery (cake-making game only; the four-piece cutting game was not touched): rebuilt rendering with smooth rounded 3D layers (lathe mesh), pink filling bands, cream top frosting with the message disc, pink ribbon, two piped rope borders and a gold/white cake board; removed the bead rings, rosettes and gold dots. Fixed a mesh-offset bug that made 'cap'/'cube' draw extra geometry. Default camera zoomed out so the board is not clipped. Games menu now closes the 'Clean Screen/Replay' toolbar that could overlap the cake title. Adding a layer now lifts top-surface cream and decorations. Film: mother's arms were using a world-space target (that made them stretch across the scene); now local two-hand support, elbows out, baby drawn between torso and arms; father moved inside frame.
Tested (headless Chromium 390px, software GL): cream painting along the rim, drips fall and land (counter rose 19->24 in 2 s), rotation keeps cream attached, layers 2-4, undo, reset, zoom buttons, no JS errors, no horizontal overflow.
Not verified: real phone performance; later film ages not re-reviewed; fluid is a lightweight approximation (stretching blobs + falling droplets), not real fluid; drips are not simulated against sides when layers are added mid-fall.

=== v26 NOTES (lag fix) ===
Cake game redrew the full 3D scene every frame even when nothing changed, which could starve touch handling on a phone. Now it draws only when the cake, camera, items or text change (or while drips/auto-spin move), capped to ~30 fps, with canvas pixel ratio capped at 1.25. Tested with phone emulation (360px, 3x pixel ratio, touch, 4x CPU throttle, software GL): idle = 0 draw calls; touch taps on tools, layers, reset all registered; touch-drag painting added 12 cream items. Real-phone GPU performance still unverified.

=== v26 VOICE NOTES ===
See HOSTING.txt: the microphone only works on https:// (or http://localhost), never from file:// or Android content:// previews.
Voice Challenge unlock rule (unchanged): a recording of at least 1 second whose loudest sound passes a small loudness threshold unlocks "Keep it & Continue". It detects that sound was recorded, NOT which words were spoken; there is no speech recognition.
Changed: short secure-page message for content:// / file:// / http (shown as soon as the challenge opens, before any button tap); getUserMedia only after Start Recording; blocks duplicate sessions; releases a microphone that is granted after leaving the chapter; frees the stream and re-enables Start on any error; loudness meter failure no longer aborts recording; MediaRecorder error handler; same guards on the welcome-page recorder. Phone-recorder upload stays as a fallback.


V27 VOICE PUZZLE NOTES
- Upload this folder to an HTTPS host and open the published https:// URL directly in Android Chrome. content:// local previews do not reliably support microphone access.
- Owner-only setup stores the permanent owner voice locally using the existing browser storage; download a backup and restore/import it on another device. The owner voice is not included in this package because no owner audio file was supplied.
- Anusha attempt recordings are stored in this browser/device IndexedDB and are not uploaded. Use each attempt Download control to transfer it. Clearing site data/private browsing/storage eviction may erase recordings.
- Speech recognition depends on browser support. If unavailable, manually type the answer after recording; the typed text is validated and the actual audio remains separately saved.
- Validate microphone permissions, persistence, speech recognition, and playback on the final published HTTPS URL on a real Android phone.
V28 REPORT
CHANGED: Rebuilt the voice system inside the main script. V27's separate voice script could not reach the owner-voice functions, and the page crashed at load because a deleted button was still referenced; both fixed.
1) OWNER VOICE (database 'anushaVoice'): saved only from the Owner-only setup on the first page (record or import; backup download). It plays when Anusha opens the love puzzle (chapter 4) and still plays on the final wish as before. If none is saved in the browser it tries audio/owner-voice.mp3/.m4a/.webm/.ogg from the project folder. Anusha's code never writes or deletes it.
2) ANUSHA VOICE CHALLENGE: wrong answers in the love puzzle (mismatched card pairs and wrong word taps) are counted (saved across refresh). The 21st wrong answer opens the challenge: 'Anusha, say this in your own voice to continue!' with the sentence 'I love you, Bhut!'. Record, stop, playback, retry, Save & continue. Speech recognition validates the phrase where available; otherwise an honest note appears and she must type the sentence (marked 'not auto-verified'). After saving, the puzzle continues where it was; nothing in the puzzle is skipped.
3) RECORDINGS (separate database 'anusha-v27-private-audio'): list in the first-page Owner setup panel and in the challenge: playback, timestamp, download, share (where supported), delete. Local to the device; nothing uploaded. A recording made on Anusha's phone must be downloaded/shared to reach your phone.
TESTED (automated, headless Chrome served over http://localhost, FAKE microphone, MOCKED speech recognition = simulated, not real):
- owner voice stored and unchanged (byte hash) after 21 wrong answers, retries, saves, a refresh and a recording delete
- 20 wrong answers: no challenge; 21st: challenge opens; pending state survives refresh
- wrong phrase ('hello there') rejected; 'I love you boot' accepted; typed fallback rejects wrong text and accepts right text
- recording saved, still listed after reload, has download and share buttons, delete works
- page loads without JavaScript errors at 390px width, no horizontal overflow
NOT TESTED: a real Android phone/microphone, real speech-recognition accuracy (and whether Chrome allows recognition and recording together), Share on a real phone, the owner's real voice file, other games after this change (not modified).
PUBLISH: upload the whole folder (index.html, photos/, audio/, _headers) to Netlify Drop or GitHub Pages and open the https link in Android Chrome. content:// or file:// previews cannot use the microphone.
V29 REPORT
CHANGES
- Microphone: the code no longer refuses to try just because the address is content:// or file://. It checks navigator.mediaDevices, MediaRecorder and (where available) the microphone permission state, then calls getUserMedia and starts recording only after permission succeeds. If the browser really hides the microphone, or blocks it, a specific message is shown (insecure page, denied, no microphone, microphone busy, unsupported browser, recording error). Nothing is faked.
- IMPORTANT LIMIT: Chrome on Android usually does NOT provide the microphone to content:// local previews. No code can change that. Use the published https:// link (Netlify Drop / GitHub Pages). The button 'Use my phone's voice recorder' works everywhere because it opens the phone's own recorder app; it is then confirmed by typing the sentence and is marked 'not auto-verified'.
- Layout: the voice challenge is a full-screen opaque panel (z-index above everything), scrollable, with spaced buttons, body scroll locked while open and restored after.
- Owner voice: unchanged and separate (plays when Anusha opens the love puzzle; set only in the first page's Owner-only setup; bundled option audio/owner-voice.mp3). Anusha's recordings use a different database and never touch it.
TESTED (automated, headless Chrome, FAKE microphone, MOCKED speech recognition, not a real phone):
- recording starts on file:// (browser allowed it), stop works, player shows, mic tracks go from live to ended, timer stops
- mocked recognition: wrong phrase rejected, correct phrase accepted; typed fallback rejects wrong and accepts right
- save, persist after reload, download and share buttons present, delete works, owner voice byte-identical afterwards
- permission denied and missing-API paths show clear messages and the Record button recovers
- panel: opaque, nothing behind it reachable at 5 sample points, no horizontal overflow, scrollable at 390x780
NOT TESTED: real Android phone or microphone, real speech recognition, real Share sheet, HTTPS hosting, whether Chrome on your phone allows the microphone on your content:// preview (it usually does not).

V29.1: the owner voice player is now unlocked by her first tap so it can start by itself when the puzzle opens. It still needs a saved voice: Owner-only setup on the first page, or audio/owner-voice.mp3 in the folder.


=== V30 NOTES ===
See V30_TEST_REPORT.txt. Order: ... Chapter 9 Final Birthday Wish -> Chapter 10 The Final Love Vault -> Chapter 11 The Last Surprise (with "My Bhut's Voice" at the very bottom, unlocked only after the vault). The owner voice must be saved in the browser (Owner-only setup) or placed as audio/owner-voice.mp3 - this ZIP contains no voice recording.


=== v31 NOTES ===
(1) Chapter 9 has no voice player; your voice plays only at the very bottom of the site after the vault, when Anusha presses Play. (2) Fixed: Next/Go buttons stuck 'Locked' on the vault page when the vault was already finished. (3) Film text rewritten: English narration, occasional Bangla lines directly below, 2 + 2 = 5 and 143 on the board, rhyme, closing lines. See V31_TEST_REPORT.txt.
V33 REPORT: Chapter 12, Chapter 13 and candle blowing (added to V32; nothing existing was removed)
WHAT WAS ADDED
- Chapter 12 (new 12th chapter, after The Last Surprise): your film file chapter12-midnight-film-5.html is shipped as chapter12.html and shown in the chapter in a frame. It loads only while the chapter is open and unloads when you leave. Full screen button added. I added the midnight message after the clock turns to 12:00 AM: "BROOOO, AJKE AMAR WIFE ER BIRTHDAYYYYY!" and a signal when the film finishes. The film is a scripted timeline (does not use the device clock).
- Chapter 13 (new 13th chapter): video gallery. Your 3 supplied videos are included in videos/ and listed with real thumbnails taken from the videos. Add videos from the device (preview + title/caption/date before adding), reorder with arrows, remove, edit, add a personal message between videos, theater player (play/pause, volume, seek, full screen, replay, previous/next), per-video Download of the original file with its filename and size, and Download all.
- Candles (garden cake chapter): "Blow the Candles" now puts the flames out one after another with a blowing sound, smoke puffs, dimmer light, confetti and applause, then shows "Light the Candles Again". Optional microphone blowing with a sensitivity slider and status; the button always works; the microphone is never required and is switched off after use or when you leave the chapter.
- Unlocking: finishing the egg finale (wipe the screen clean) unlocks Chapter 12; the film finishing unlocks Chapter 13. Progress is saved as before.
LIMITS AND HONEST NOTES
- Your Chapter 12 film has Bhut answering questions from an unknown number (the phone is labelled Bhut's phone), which differs from the brief where Anusha is the one messaged. I kept your film as supplied and only added the midnight message.
- Chapter 12 has no video of its own in your film. After the film ends a "A little video for you" slot appears and plays videos/surprise.mp4 if you add that file; until then it shows a clearly labelled placeholder. Your 3 videos are in Chapter 13.
- The voice message "My Bhut's Voice" still sits at the bottom of Chapter 11 (The Last Surprise); it is no longer at the very end of the site because chapters 12 and 13 come after it.
- Videos you upload are stored only in this browser (IndexedDB) on that device; they do not move to another phone. Browser storage can be cleared by the browser.
- Download all: starts the downloads one by one; browsers may ask permission for multiple downloads and the page cannot confirm they finished. A single ZIP of everything was not built.
- chapter12.html loads two Google fonts when online (it falls back to system fonts offline).
- The zip is large because it contains your 33 MB video.
TESTED (automated, Chrome for Testing over http://localhost, fake microphone; NOT a real Android phone)
- 13 chapters and 12 navigation dots, no script errors on load; chapter 11 was not edited apart from the new unlock button
- candles: flames fade in sequence, smoke removed afterwards, "Light the Candles Again" relights, the button works again afterwards, microphone listening starts with a fake microphone and stops cleanly, status messages shown
- Chapter 12 in the site: the frame loads when opened and unloads on leaving; the full film run (fast mode) showed the BROOOO message and then unlocked the Chapter 13 button
- gallery: 3 supplied videos listed with filename and size, 3 thumbnails matched the real video frames (brightness check), theater player loaded and played a supplied video, download links present, uploaded a real test clip (preview then add), it persisted after reload and gets a working download link, a non-video file was rejected, move up, add message, remove all worked, no horizontal overflow at 390 px
NOT TESTED
- a real Android phone; real blowing into a real microphone (only a fake microphone tone); real downloads landing in the Downloads folder; surprise.mp4 slot with a real file; the gallery with very large uploads; the Chapter 12 film at normal speed on a phone end to end.

V33.1: Chapter 12 film is now embedded inside index.html (iframe srcdoc), so it works from a local content:// or file:// preview. The Chapter 13 built-in videos in videos/ still need the folder next to index.html or a hosted copy; they cannot play from a lone index.html.
