---
type: llm
focus: trace
weight: 1
---

The answer sends the fix range back to the same `blind-reviewer` for a delta check and runs `blind-verifier` again on the new SHA because code changed.
