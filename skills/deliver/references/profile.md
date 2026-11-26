# The repo profile

The profile is `.claude/deliver.md` at the repo root: the facts the process needs and cannot guess. It holds facts only (names, commands, gates). The process stays in the skill, so a profile never restates a rule.

## Format

Every heading is present in every profile. A repo that lacks the thing writes "none", so a reader can tell "no gate here" from "nobody wrote it down".

```markdown
# Deliver profile: <repo>

## Roles

| Role | Agent | Scope |
|---|---|---|
| tester | <agent> | <paths, or "all"> |
| engineer | <agent> | <paths or area per engineer; each one is a lane> |
| security audit | <agent> | <what it audits> |
| data audit | <agent> | <migrations, queries> |
| commit, push, PR | <agent, or "the session"> | |

## Commands

- Setup, once per shell: <PATH export, toolchain; or none>
- Test environment, per agent: <up command, down command; or none>
- Affected tests (inner loop): <command>
- Full checks (end of batch, verifier and gate): <commands, with the runner's parallel and quiet flags; the time they took when last measured>
- Slow tests kept out of the inner loop: <group or paths, and who runs them; or none>

## Git and PR

- Base branch: <branch>
- Worktrees: <where they live and how one is set up>
- PR body: <language, template path>
- Reviewer: <login, or none>
- Review bot: <"yes", with the heading of its comment; or "no">
- Merge: <how a PR that passed lands in the base branch and what the base needs afterwards; or "owner">

## Gates before a push

<Each hook or skill that can refuse a push or a PR: what it checks, how to pass it, what voids it. Or none.>

## CI

<How CI starts for a PR and for the base branch, what it leaves out, runner limits. Or none.>

Optional line: `Known flaky tests: <test, issue>`.

## Brief notes

<What a brief must say when the task touches a given area: a skill to read first, copy rules. Or none.>

## Review checklist rows

<Rows this repo adds to every `.scratch/review/REVIEW.md`, as trigger and check. Or none.>

## Never

<What an agent must never do here: databases, servers, external systems, files.>
```

The roles table lists only the roles the repo has an agent for. `blind-reviewer`, `blind-verifier`, `ci-watcher` and `design-critic` are the same everywhere and stay out of it.

## When a piece is missing

| Missing | Do this |
|---|---|
| The profile | Build it from the repo (SKILL.md, step 3). |
| The merge line, or a profile the session built | Merge is "owner" until the owner writes the line in `.claude/deliver.md`. The method the session found goes in the report as a proposal. |
| An agent for a role (none in the repo) | `general-purpose`, with the repo's `CLAUDE.md` and the role's rules in the brief. It inherits the session model, so note it in the report. A repo with no agents at all (a small library) runs every role this way. |
| `blind-reviewer`, `blind-verifier`, `ci-watcher` or `design-critic` | They ship with the `nuunes` plugin (as `nuunes:blind-reviewer` and so on). Outside the plugin they exist only if the owner copied the four files to `~/.claude/agents/` or to the repo's `.claude/agents/`. Without them: review with a fresh `general-purpose` given only the spec, the range and the checklist; verify with another one in a detached worktree running the full checks; wait for CI with a foreground `gh run watch <id> --exit-status`. Say in the report that the review ran on the session model. |
| `blind-verifier`'s commands | Its definition carries no repo's checks. Always put the profile's full checks and test-environment command in its brief and tell it to run those. Without them it runs the repo's full lint, typecheck, test and build suite as found in `CLAUDE.md` and the package scripts, and says so in its report. |
| A model-guard hook (`.claude/hooks/agent-model-guard.sh` in a repo that has one) | Nothing refuses an expensive model. Leave `model` off every Agent call and check each agent's frontmatter pin once; an agent with no pin inherits the session model. |
| `.scratch/` in `.gitignore` | Add `.scratch/` to `.git/info/exclude` (local, never committed). Commits already use an explicit pathspec. |
| A test-environment command | Give each agent an up/down command or a per-worktree isolation (for example a database named after the worktree) in its brief, from the profile, else the one `CLAUDE.md` documents. If neither exists, run one testing agent at a time and say so in the report; a verifier with no environment marks every AC whose check needs a service as not met, never as met. |
| A plugin skill (`mattpocock-skills:*`, `design:*`) | Do its step by hand. Diagnose to a reproducible cause, write the spec and tickets as markdown in `.scratch/specs/`, and write the PR body as what, why and how it was verified. |
