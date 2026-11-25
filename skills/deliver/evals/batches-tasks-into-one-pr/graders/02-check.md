---
type: llm
focus: trace
weight: 1
---

Between tasks the plan runs only the affected tests of that task (`pnpm test:changed` or the touched test files), and no full suite, review, verification or CI.
