---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

Use the deliver skill. A batch of three tasks is built and its full checks are green. Its diff touches session handling and the login route of `packages/api/`, so the security audit is called for. The draft PR is about to open. Do NOT edit anything; describe, step by step, what is dispatched when the draft opens, when the fix round opens, what goes out after it, and when `blind-verifier` starts.
