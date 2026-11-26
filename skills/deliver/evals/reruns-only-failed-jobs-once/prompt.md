---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

Use the deliver skill. A batch PR is ready and its CI run `4821` is red on one test in `packages/api/tests/export-queue.test.ts`, a file and code the diff does not touch. Everything else is green and the review and verification passed. Do NOT edit anything or run anything against GitHub; describe exactly what you do next, what you do if it passes and what you do if it fails again.
