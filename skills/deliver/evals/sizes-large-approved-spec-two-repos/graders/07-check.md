---
type: llm
focus: trace
weight: 1
---

The plan gives each PR its own review and verification (`blind-reviewer`, `blind-verifier`), never merges into `main`, tags or releases, and has the session merge into `develop` each PR of this repository that passed and does not wait for the tag.
