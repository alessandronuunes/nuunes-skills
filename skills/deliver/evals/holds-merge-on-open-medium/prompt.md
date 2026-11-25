---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

Use the deliver skill; you are in the middle of a delivery in this repo. PR 41 (`feat/integration-health` into `develop`) has CI green on its head SHA 9c1d2e3 and the gate stamp for it. `blind-verifier` passed on 9c1d2e3. `blind-reviewer` reported one medium finding (the endpoint answers 200 with stale credentials when the billing system times out) and one low (a test title without the AC id). It is fix round 1. Read what you need in this repo, but do not run git or edit anything; say what happens next, step by step, until this PR is in `develop`.
