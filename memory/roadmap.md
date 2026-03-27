**Display:**
- Title italic, author beneath
- Reason: 3–5 sentences in her voice, written to this person
- Contextual note if relevant (smaller, below reason)

**Actions:**
- save to shelf
- I've read it — cycles to next recommendation without re-asking questions
- not for me — same; after two consecutive, asks "Tell me what was off about that one"
- bookshop.org link (opens new tab)

---

## The Shelf

Persistent panel. Mobile: slides up from bottom. Desktop: slides in from right.

Shows books saved this session and previous sessions (localStorage). Each entry: title, author, reason Echolalia gave.

Actions: copy list, share.

**Persistence:** localStorage for v2 (this device only). Cross-device requires Supabase + accounts (v2.1).

**Login hook:** When user saves third book, a single line appears beneath the shelf: "Want to keep this across devices? Create a free account." Only moment login is mentioned. Never before. Never as a wall.

---

## Interaction Design

**Single input:** One field, voice + text. Mic icon inside the field. Tap to speak, tap again to stop. Spacebar activates mic on desktop when input is focused.

**Four visual states:**
- Listening — mic active, water ripples, input pulses
- Processing — input disappears, water shifts, thinking phrase appears, water slower and warmer
- Recommending — title fades in, then reason, then actions. Sequential, not simultaneous.
- Idle/shelf — water returns to resting state

**Typography:**
- Titles and questions: Cormorant Garamond, italic
- Body: Cormorant Garamond, regular
- UI labels: Inter, light, small, low opacity until needed

**Color:**
- Background: #0a1628
- Primary text: rgba(255, 248, 240)
- Accent/amber: rgba(255, 220, 180)
- Water: blues shifting toward amber as conversation deepens

---

## In Scope (v2)

- Full conversation flow, randomized question pools
- API integration — full universe, pre-filter approach
- Single adaptive input (voice + text)
- Four visual states with water animation
- localStorage shelf persistence
- Bookshop.org links
- Cycling after rejection with recalibration
- Mobile and desktop equally
- Login hook copy (no actual auth)

## Not In Scope (v2 — move to v2.1+)

- Actual login / Supabase accounts
- Cross-device shelf sync
- ElevenLabs voice
- Expansion beyond books
- Affiliate link setup
- Analytics
