---
type: llm
focus: trace
weight: 1
---

The merge step uses the method of the repo profile pinned to the SHA that passed (`git push origin <sha>:refs/heads/develop`), not `gh pr merge` and not a push of a local `develop`.
