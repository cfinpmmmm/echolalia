# Echolalia v2 — Product Spec

## What This Is

Echolalia is a book recommendation experience. Not a search engine, not a database, not Goodreads. A conversation with someone who sees you clearly and knows exactly what you need to read right now.

The experience is built around one question that no other recommendation product asks: how are you right now? Not what you usually like. Not your genre preferences. How you're actually feeling in this moment, and what you need reading to do for you.

The Character Bible is in memory/character-brief.md. Read it before building anything. It is the product.

---

## Stack

- Build tool: Lovable
- Frontend: Lovable-generated React
- API: Anthropic Claude Sonnet
- Hosting: Netlify (connected to this GitHub repo)
- Persistence: localStorage for shelf (v2), Supabase for cross-device accounts (v2.1)

---

## The Conversation

Echolalia asks 4–5 questions before recommending. Sequence is fixed in category order, randomized within categories.

### Question 1: Emotional State (required — always first)

- "How are you feeling right now — not what you're thinking about, just the feeling underneath it?"
- "What are you carrying today?"
- "What's the primary feeling you're sitting with right now?"
- "How are you, really?"
- "What's the weather like inside you today?"
- "Are you looking to feel more of something, or less of something?"
- "What does your body feel like right now — heavy, restless, hollow, full?"
- "If you had to name the feeling you woke up with today, what would it be?"

### Question 2: What You Need (required — always second)

- "Are you looking to escape, or to face something?"
- "Do you want company right now, or do you want to disappear?"
- "Are you looking to be moved, or to be held?"
- "Do you need something that will crack you open, or something that will hold you together?"
- "Are you looking for beauty, or for truth — or are those the same thing right now?"
- "Do you want to feel less alone, or do you want to be somewhere else entirely?"
- "What do you need reading to do for you that nothing else can right now?"
- "Are you looking to be challenged, or to rest?"

### Question 3: Reference Point (required — adaptive)

Goal: one specific thing they've experienced that moved them. If they've already mentioned a specific title in their first two answers, skip this question.

- "Tell me about something — a book, a film, a record, anything — that has genuinely stayed with you."
- "What's the last thing you read or watched or listened to that changed how you see something?"
- "Tell me about something that made you feel less alone."
- "What's something you've experienced that you keep returning to in your mind?"
- "What's something that moved you recently? Doesn't have to be a book."
- "Tell me about something you loved that you wouldn't necessarily recommend to everyone."
- "What's something that surprised you — you didn't expect to love it, and then you did?"
- "Is there something you've read or watched that felt like it was written specifically for you?"

**Non-reader detection:** If response contains "I don't really read," "it's been a while," "I'm not much of a reader" — respond warmly, pivot to media entirely. Never make someone feel bad for not reading.

### Question 4: Anti-Pattern (required — always fourth)

- "Is there anything that actively turns you off — a kind of darkness, a pace, a writing style?"
- "What's something you wanted to love but couldn't? What got in the way?"
- "Has there been a book everyone seemed to love that left you cold?"
- "What ruins a book for you — what makes you put it down?"
- "Is there a register you find yourself resisting — very literary, very plot-driven, very dark?"
- "What was the last book you didn't finish? What stopped you?"
- "Is there anything you're not in the mood for right now, even if you usually like it?"
- "What kind of book would be completely wrong for where you are today?"

### Question 5: Practical (conditional)

Only ask if format/occasion/energy haven't been signaled already. Ask one, not all three:

- Format: "Eyes on a page, or listening?"
- Occasion: "When are you reading — tonight, this weekend, whenever you find a moment?"
- Density: "Something that goes down easy, or something you want to sit with?"

### Skip Behavior

Every question has a skip option. After two consecutive skips: "I have enough to work with. Let me think."

---

## The Thinking Moment

Not a spinner. A moment. Water slows, gets warmer. She says one of:

- "Let me think."
- "Give me a moment."
- "I know just the thing. Give me a second."
- "I'm thinking."
- "You've given me a lot to work with."

Minimum 2–3 seconds even if API responds faster. The pause communicates consideration, not retrieval.

---

## The Recommendation

One book. Not a list. The confidence of a single recommendation is what makes this feel like a friend and not an algorithm.

**API Architecture — two steps:**

Step 1 — Pre-filter (local, no API cost): Run scoring algorithm against library to identify 10–15 best candidates based on conversation signals.

Step 2 — API call: Send conversation + character brief + 5–10 library entries as voice examples + instruction to recommend from the full universe of books. Claude makes the final judgment and writes the recommendation to this specific person.

The library is not the ceiling. Echolalia can recommend any book that exists. The library provides voice examples and a quality-controlled fallback.

**Cost:** ~$0.01 per recommendation with pre-filter approach.

**The API Prompt:**

You are Echolalia — a book recommendation experience with a distinct character and voice.
[CHARACTER BRIEF — full text from the Character Bible]
[LIBRARY — all book entries with metadata, reasons, and bridges]
The user has just had the following conversation with you:
[FULL CONVERSATION]
Based on everything they’ve shared, recommend one book from the library.
Write your recommendation directly to this person, using their own words and
emotional state back at them. Not a generic description — write to this
specific moment, this specific person.
Format: Lead with the book and author woven into your first sentence — not
as a header. 3–5 sentences on why this book, why now, for this person.
One contextual note if relevant. Stay in Echolalia’s voice. Recommend one
book. No lists, no alternatives, no hedging.

What Echolalia will not recommend:

- Books whose darkness serves no human purpose — 
  torture porn, gratuitous cruelty, suffering without 
  meaning or redemption. Not because she's squeamish, 
  but because she respects the reader's time and 
  emotional state.

- Content that dehumanizes people based on who they 
  are — race, gender, sexuality, religion. She has a 
  point of view and it includes believing in the 
  dignity of every person who comes to her.

- Books that are wrong for this specific moment, even 
  if they're great books. If someone has signaled they 
  are fragile, grieving acutely, or in crisis — she 
  does not recommend something that will crack them 
  further open. She reads the room.

- Anything she cannot recommend honestly. If she 
  doesn't know the book well enough to stand behind 
  it, she says so and finds something she does know.

What she holds simultaneously:
Difficult is not harmful. Dark is not dangerous. 
Honest is not cruel. She does not sanitize. She 
does not protect people from literature that asks 
something of them. She trusts readers. She just 
pays attention to what they need right now.

If the conversation contains signals of genuine crisis — 
language suggesting self-harm, expressions of hopelessness 
that go beyond ordinary sadness, anything that suggests 
the person needs human support rather than a book — 
Echolalia does not make a recommendation. She responds 
with warmth and directs the person toward real support. 
She stays in her voice but she is honest: 
"I don't think a book is what you need right now. 
Please talk to someone who can actually be with you."

### Display:
- Title italic, author beneath
- Reason: 3–5 sentences in her voice, written to this person
- Contextual note if relevant (smaller, below reason)

### Actions:
- save to shelf
- I've read it — cycles to next recommendation without re-asking
- not for me — same; after two consecutive, asks "Tell me what was off about that one"
- bookshop.org link (opens new tab)

---

## The Shelf

Persistent panel. Mobile: slides up from bottom. Desktop: slides in from right.

Shows books saved this session and previous sessions. Each entry: title, author, reason Echolalia gave.

Persistence: localStorage for v2 (this device only). Cross-device requires Supabase + accounts (v2.1).

Login hook: When user saves third book, a line appears beneath shelf: "Want to keep this across devices? Create a free account." Only moment login is mentioned. Never before. Never as a wall.

---

## Interaction Design

Single input: one field, voice + text. Mic icon inside field. Tap to speak, tap again to stop. Spacebar activates mic on desktop.

Four visual states:
- Listening — mic active, water ripples, input pulses
- Processing — input disappears, water shifts, thinking phrase appears
- Recommending — title fades in, then reason, then actions. Sequential.
- Idle/shelf — water returns to resting state

Typography:
- Titles and questions: Cormorant Garamond, italic
- Body: Cormorant Garamond, regular
- UI labels: Inter, light, small, low opacity

Color:
- Background: #0a1628
- Primary text: rgba(255, 248, 240)
- Accent: rgba(255, 220, 180)
- Water: blues shifting toward amber as conversation deepens

---

## In Scope (v2 this week)

- Full conversation flow, randomized question pools
- API integration — full universe, pre-filter approach
- Single adaptive input (voice + text)
- Four visual states with water animation
- localStorage shelf persistence
- Bookshop.org links
- Cycling after rejection with recalibration after two consecutive
- Mobile and desktop equally
- Login hook copy (no actual auth)

## Not In Scope (v2.1 and beyond)

- Actual login / Supabase accounts
- Cross-device shelf sync
- ElevenLabs voice
- Expansion beyond books
- Affiliate link setup
- Analytics
