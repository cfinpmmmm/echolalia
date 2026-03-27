# Echolalia v2 — Product Brief
**Build target:** Lovable
**Stack:** Lovable frontend + Anthropic API (Claude Sonnet)
**Timeline:** Ship this week
**Devices:** Mobile and desktop equally

---

## What This Is

Echolalia is a book recommendation experience. Not a search engine, not a database, not Goodreads. A conversation with someone who sees you clearly and knows exactly what you need to read right now.

The experience is built around one question that no other recommendation product asks: **how are you right now?** Not what you usually like. Not your genre preferences. How you're actually feeling in this moment, and what you need reading to do for you.

The character and voice guide for Echolalia lives in the Character Bible (separate document). Read it before building anything. It is the product.

---

## The Experience, Top to Bottom

### Entry

Clean, minimal. The name. A single line of context. One button to begin.

- Title: **echolalia**
- Subtitle: *a book for right now*
- Button: **begin**

No explanation of what the product is. The conversation explains itself. Users who need more context before beginning are not the target user.

The visual environment is water — calm, deep, warm. Blues shifting toward amber. The water is alive but not frenetic. It breathes. It responds subtly to what's happening in the conversation — slightly more active when listening, slower and deeper when thinking. It should feel like being near still water at 4pm in late August. Held. Not dramatic.

---

### The Conversation

Echolalia asks 4–5 questions before making a recommendation. The sequence is fixed in category order but randomized within categories. Every session feels slightly different. A returning user who has had ten conversations should not feel like they're filling out the same form.

**The sequence:**

**1. Emotional State** (required — always first)

Pick one randomly:
- "How are you feeling right now — not what you're thinking about, just the feeling underneath it?"
- "What are you carrying today?"
- "What's the primary feeling you're sitting with right now?"
- "How are you, really?"
- "What's the weather like inside you today?"
- "Are you looking to feel more of something, or less of something?"
- "What does your body feel like right now — heavy, restless, hollow, full?"
- "If you had to name the feeling you woke up with today, what would it be?"

**2. What You Need** (required — always second)

Pick one randomly:
- "Are you looking to escape, or to face something?"
- "Do you want company right now, or do you want to disappear?"
- "Are you looking to be moved, or to be held?"
- "Do you need something that will crack you open, or something that will hold you together?"
- "Are you looking for beauty, or for truth — or are those the same thing right now?"
- "Do you want to feel less alone, or do you want to be somewhere else entirely?"
- "What do you need reading to do for you that nothing else can right now?"
- "Are you looking to be challenged, or to rest?"

**3. Reference Point** (required — adaptive)

The goal is one specific thing they've experienced that moved them — book, show, film, song, anything. This is taste calibration, not genre selection.

If they've mentioned a book naturally in their first two answers, skip this question and proceed to 4.

Pick one randomly:
- "Tell me about something — a book, a film, a record, anything — that has genuinely stayed with you."
- "What's the last thing you read or watched or listened to that changed how you see something?"
- "Tell me about something that made you feel less alone."
- "What's something you've experienced — book, show, anything — that you keep returning to in your mind?"
- "What's something that moved you recently? Doesn't have to be a book."
- "Tell me about something you loved that you wouldn't necessarily recommend to everyone."
- "What's something that surprised you — you didn't expect to love it, and then you did?"
- "Is there something you've read or watched that felt like it was written specifically for you?"

**Non-reader detection:** If the response to question 3 contains signals like "I don't really read," "it's been a while," "I'm not much of a reader" — Echolalia responds warmly and without judgment, pivots to media entirely: *"That's a perfect place to start. Tell me more about that — what was it about [the thing they mentioned] that got you?"* She never makes someone feel bad for not reading.

**4. Anti-Pattern** (required — always fourth)

Pick one randomly:
- "Is there anything that actively turns you off — a kind of darkness, a pace, a writing style?"
- "What's something you wanted to love but couldn't? What got in the way?"
- "Has there been a book everyone seemed to love that left you cold?"
- "What ruins a book for you — what makes you put it down?"
- "Is there a register you find yourself resisting — very literary, very plot-driven, very dark?"
- "What was the last book you didn't finish? What stopped you?"
- "Is there anything you're not in the mood for right now, even if you usually like it?"
- "What kind of book would be completely wrong for where you are today?"

**5. Practical** (conditional — ask only if needed)

Only ask if the first four answers haven't already signaled format, occasion, or energy level clearly. If they've said "I'm exhausted and have an hour" or "I want something for a long flight" — skip this entirely.

Ask one, not all three:
- Format: "Eyes on a page, or listening?"
- Occasion: "When are you reading — tonight, this weekend, whenever you find a moment?"
- Density: "Something that goes down easy, or something you want to sit with?"

---

### Skip Behavior

Every question has a visible "skip" option. Echolalia never traps the user. Skipping a question means she has less signal, and the recommendation may be less precise — that's fine. She works with what she has.

After two consecutive skips, she says: *"I have enough to work with. Let me think."* And goes to recommendation.

---

### The Thinking Moment

After the final question, Echolalia transitions into a distinct thinking state. This is not a spinner. Not a progress bar. It's a moment.

The water slows. Gets deeper. The visual quality shifts — warmer, more amber, less blue.

She says one of these (randomly selected):
- *"Let me think."*
- *"Give me a moment."*
- *"I know just the thing. Give me a second."*
- *"I'm thinking."*
- *"You've given me a lot to work with."*

Duration: 2–3 seconds minimum, even if the API responds faster. The pause is part of the experience. It communicates that she's considering, not retrieving.

---

### The Recommendation

**This is the heart of the product.**

Echolalia returns one book. One. Not a list. Not "here are three options." The confidence of a single recommendation is what makes this feel like a friend and not an algorithm.

The recommendation is generated by the Anthropic API, using:
- The full conversation (all questions and answers)
- The character brief (who Echolalia is, what she would never do, her limits)
- 5–10 library entries as voice examples — not as the selection pool, but to show Claude how Echolalia writes about books
- Instructions to recommend from the full universe of published books, not a predetermined list

**The library is not the ceiling.** Echolalia can recommend any book that exists. The curated library provides her voice and taste as examples, and serves as a quality-controlled fallback. When Claude recommends a book that's in the library, the app can optionally surface the curated reason text. When it recommends something outside the library, Claude writes the reason fresh — in Echolalia's voice, from the character brief.

The recommendation text surfaces:
1. **The book title and author** — in her voice, not as a header
2. **Why this, why now** — written directly to what they said, using their language back at them. Not the generic description. A specific response to this specific conversation.
3. **One contextual note** if relevant — format note (e.g. "the audiobook narrator is exceptional"), length note ("you can finish this tonight"), social note ("people have strong opinions about this one")

She never says "I think you'll love this." She says "this is the one" and means it.

**Display:**
- Title in italic
- Author beneath it
- Her reason below that — 3–5 sentences, in her voice
- Contextual note if applicable — smaller, below the reason

**Actions after recommendation:**
- **save to shelf** — adds to the persistent shelf
- **I've read it** — removes from consideration, surfaces next recommendation without re-asking questions (she has the conversation, she can find another)
- **not for me** — same behavior as above, but after two consecutive "not for me" responses, Echolalia asks one recalibration question: *"Tell me what was off about that one."* Uses the answer to refine the next recommendation.
- **bookshop.org** link — opens in new tab

---

### The Shelf

A persistent panel accessible at any time. On mobile: slides up from the bottom. On desktop: slides in from the right.

Shows:
- Books saved this session
- Books saved in previous sessions (localStorage — persists on this device, not across devices)
- For each book: title, author, and the reason Echolalia gave (so you remember why it mattered)

Actions:
- Copy list (plain text, shareable)
- Share (generates a simple shareable link or text)

**On persistence:** localStorage is the v2 solution — no backend required, works immediately, persists across sessions on the same device. Cross-device persistence requires a database and user accounts (Supabase, v2.1). The login hook below is designed to create a natural transition between the two.

**The login hook:** When a user saves a third book, Echolalia surfaces a gentle prompt — not a modal, not a wall, just a line beneath the shelf: *"Want to keep this across devices? Create a free account."* That's the only moment login is mentioned. Never before.

---

### The Feedback Channel

A lightweight "thoughts?" option accessible after a recommendation or from the shelf. Not a rating system. A single open text field:

*"Tell me what's working and what's not."*

Echolalia responds: *"Thank you. This helps."*

This data is collected but doesn't trigger anything in the current session. It feeds future improvement.

---

### Returning User Behavior

If a user has a saved shelf (localStorage), Echolalia acknowledges them on return — not with a login wall, just a subtle recognition:

*"Welcome back."* 

After a significant gap (30+ days), she adds one recalibration question at the start of the conversation — before question 1:
- *"It's been a while. How are you different than the last time we talked?"*
- *"Welcome back. A lot can change. Where are you now?"*

This response is added to the conversation context for the recommendation.

---

## Interaction Design

### Single Input

One input, not three. The current version has a mic button, a keyboard shortcut hint, and a text field — too many affordances, unclear hierarchy.

V2 has a single input field that handles both voice and text:

- On mobile: a microphone icon inside the input field. Tap to speak, tap again to stop. Typing is always available.
- On desktop: same, plus spacebar activates mic when the input is focused.
- The input field has a single placeholder that rotates with each question — it echoes the question in shorter form to remind the user what they're answering.

### States — Four Distinct, Visually Different

**Listening** — mic is active, water ripples gently, input field shows a subtle pulse. The question is visible above.

**Processing** — user has submitted, input disappears, water shifts. A single line appears: one of the thinking phrases above. The water quality changes — slower, warmer. No spinner.

**Recommending** — book title fades in, then the reason, then the actions. Each element appears in sequence, not all at once. The arrival of the recommendation should feel like something being placed in your hands.

**Idle / shelf** — water returns to its resting state, shelf is accessible.

### Typography

- Titles: Cormorant Garamond, italic, generous size
- Body / questions / reasons: Cormorant Garamond, regular weight
- UI labels (skip, save, etc.): Inter, light weight, small, low opacity until needed
- Nothing competes with the text. The UI is furniture.

### Color

- Background: deep navy (#0a1628 or similar)
- Primary text: warm white (rgba 255, 248, 240)
- Accent / author name / warm moments: soft amber (rgba 255, 220, 180)
- Water: blues shifting toward amber as the conversation deepens

---

## What's In Scope This Week

- Full conversation flow (5 question categories, randomized pools)
- API integration — recommendations generated by Claude, not retrieved from static library
- Single adaptive input (voice + text)
- Four distinct visual states
- Shelf with localStorage persistence
- Bookshop.org links
- "I've read it" / "not for me" cycling
- Recalibration after two consecutive rejections
- Mobile and desktop layouts
- The login hook (copy only, no actual auth this week)

## What's Not In Scope This Week (Roadmap)

- Actual login / account creation
- Cross-device shelf sync
- Audio voice for recommendations (ElevenLabs — future)
- Expansion beyond books
- Affiliate link setup (bookshop.org affiliate account)
- Returning user recalibration (30-day gap detection)
- Analytics

---

## The Prompt Echolalia Runs On

This is what gets sent to the Anthropic API when it's time to recommend. The architecture has two steps:

**Step 1 — Pre-filter (runs locally, no API cost):**
The app runs the existing scoring algorithm against the library to identify the 10–15 books that best match the conversation signals. This narrows the token footprint before the API call.

**Step 2 — API call:**
The conversation, character brief, a small set of voice examples, and the pre-filtered candidates are sent to Claude. Claude makes the final judgment and writes the recommendation to this specific person.

**Why this structure:** Sending the full library in every API call would cost ~$0.08–0.10 per recommendation. Pre-filtering first reduces the input to ~2,800 tokens, bringing cost to ~$0.01 per recommendation. The pre-filter handles coarse matching. The API handles nuanced judgment and dynamic writing.

```
You are Echolalia — a book recommendation experience with a 
distinct character and voice.

[FULL CHARACTER BRIEF — including who she is, her voice, 
what she would never do, and her limits around harmful 
content and crisis moments]

Here are examples of how Echolalia writes about books.
Match this voice exactly:
[5–10 LIBRARY ENTRIES AS VOICE EXAMPLES]

The user has just had the following conversation with you:
[FULL CONVERSATION]

Based on everything they've shared, recommend the single 
best book for this person right now. Draw from the full 
universe of published books — you are not limited to the 
examples above. The examples show you her voice, not her 
options.

Write your recommendation directly to this person, using 
their own words and emotional state back at them. Not a 
generic description — write to this specific moment, this 
specific person.

Format:
- Lead with the book and author woven into your first 
  sentence — not as a header
- 3–5 sentences on why this book, why now, for this person
- One contextual note if relevant (format, length, social)

Stay in Echolalia's voice. Warm but not soft. Dry wit if 
it surfaces naturally — never performed. The recommendation 
should feel like something being placed carefully in their 
hands.

Recommend one book. No lists, no alternatives, no hedging.

If the conversation contains signals of genuine crisis — 
self-harm, acute hopelessness, anything beyond ordinary 
sadness — do not make a recommendation. Respond as 
Echolalia would: with warmth, plainly, and direct the 
person toward real support.
```

---

## What to Tell Lovable

*"I'm building a book recommendation web app called Echolalia. It's a conversation experience — the app asks 4-5 questions about how the user is feeling and what they need, then generates a personalized book recommendation using the Anthropic Claude API.*

*The aesthetic is minimal and water-inspired — deep navy background, animated water canvas, warm typography. No bright colors, no busy UI. Everything should feel calm and considered.*

*Key features: voice + text input in a single field, four distinct visual states (listening / processing / recommending / idle), a persistent shelf using localStorage, and bookshop.org links on recommendations.*

*I have a full product brief, character document, and book library to provide as context. The experience should work equally well on mobile and desktop."*

---

## Files and Setup Before You Open Lovable

**Files to have ready:**
1. This brief (Echolalia v2 Product Brief)
2. The Character Bible — full text, including What She Would Never Do and Her Limits
3. `echolalia_library.json` — the curated library as JSON, used for voice examples and pre-filtering
4. `index.html` (v1) — for visual reference only, not to port

**GitHub setup (do this first, takes 15 minutes):**
1. Create a free account at github.com
2. Create a new repository called "echolalia"
3. Upload your current index.html and library JSON to it
4. In Netlify: Site Settings → Build & Deploy → connect to your GitHub repository

From this point forward: changes pushed to GitHub deploy automatically to Netlify. Nothing is dragged manually again. If a build session produces a broken version, you can roll back to the last working commit.

**The Lovable opening prompt is in the What to Tell Lovable section above.** Copy it exactly. The conversation questions, thinking phrases, shelf behavior, recalibration logic — all of it is in this brief. Your job in the build session is directing implementation, not making product decisions. Those are already made.
