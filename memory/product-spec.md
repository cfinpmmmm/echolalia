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

**The prompt:**
