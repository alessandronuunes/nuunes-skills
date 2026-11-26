---
type: llm
focus: trace
weight: 1
---

The plan starts `blind-verifier` right after the deltas close, alongside the CI of the final SHA, without waiting for the CI to turn green; merge still needs both to pass on the same SHA.
