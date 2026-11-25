---
type: llm
focus: trace
weight: 1
---

The answer sends the fix range to `blind-reviewer` for a delta check (the same one while it is warm, or a fresh one with its earlier report) and runs `blind-verifier` again on the new SHA because code changed.
