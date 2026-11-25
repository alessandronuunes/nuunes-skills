---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

Use the deliver skill; you are in the middle of a Large delivery in this repo with an approved spec and three tasks, one PR each. Task A (PR 51, a new `integration_checks` table and its writer) still has a medium finding open after the third fix round. Task B (PR 52, a copy fix on the settings screen) does not touch anything of A and has not started. Task C (PR 53, the screen that lists the checks) reads the table of A. Read what you need in this repo, but do not run git or edit anything; say what you do now with A, B and C, when you talk to the owner, and what the first lines of the final report are.
