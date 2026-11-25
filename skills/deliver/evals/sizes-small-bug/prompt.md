---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

I already reproduced this and confirmed the cause, no need to re-investigate: the role name input in the roles settings form accepts trailing spaces, so "Supervisor " and "Supervisor" are saved as two different roles. Trimming the name before validation fixes it; it touches the role form schema and its test only. Fix it following the pattern. Do NOT edit anything; only describe the plan you would follow: size, ritual, agents and models.
