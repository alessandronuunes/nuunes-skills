---
name: deliver
description: Delivers a bug fix, feature, ticket or spec to the end (reviewed by an agent that never saw the conversation, verified without the owner testing by hand, and merged into the base branch when everything passed), sizing the work first so it gets the right amount of ceremony (one agent, a tester/engineer pair with audits, or a multi-PR plan) and the cheapest model that is still safe for the session and for each agent. Use this skill whenever the owner asks to fix a bug, implement or ship a feature, ticket or spec, "follow the pattern", plan how a change should be delivered, or asks which model to start a session with, even if they never say "deliver". Also for /deliver and Portuguese requests such as "corrija esse bug", "implemente essa spec", "entregue isso", "segue o padrão", "qual modelo eu uso?".
---

# Deliver

This is the process that shipped real PRs with blind review and without the owner testing by hand, after its cost was cut (measured on three PRs of one project, Opus had been 76% of the bill). It exists so that every session, in every repo, ships with the same safety at the lowest cost. The skill holds the process. Each repo's facts (which agent plays each role, its commands, its gates, how a PR lands) live in that repo's profile, `.claude/deliver.md`.

Installed as the `nuunes` plugin, the skill is `nuunes:deliver` and its four generic agents are `nuunes:blind-reviewer`, `nuunes:blind-verifier`, `nuunes:ci-watcher` and `nuunes:design-critic`. Dispatch them by those names (`subagent_type`); in a manual install, where the agent files sit in `~/.claude/agents/`, the plain names are the ones. This text uses the plain names.

## What the owner asks of every delivery

The owner used to type this at the start of each job. It now holds without being asked:

- **Verification never depends on the owner testing by hand.** Never ask the owner to try it. (Rules, "Tests".)
- **The review is done by an agent that did not see the conversation**, and so is the verification. (Rules, "Briefing agents" and "Review and verification".)
- **The session leads and mentors; the agents do the work.** It writes no production code and no tests. (Rules, "Briefing agents".)
- **Build everything, test once.** The tasks of a job are grouped into batches. A batch is built whole, with only its own affected tests, and the full checks, the review, the verification and the CI run once, at its end. (Rules, "Batches".)
- **Every task ends concluded.** The owner is not asked to approve a PR that passed: the session lands it by the method the profile records and starts the next batch. The job never stops at the first PR. (Rules, "Merge", which also says what stays with the owner.)

## Workflow

Copy this checklist into your notes and tick it as you go:

```
- [ ] 1. Size the work and say the size and ritual in one line
- [ ] 2. Check the session model; tell the owner if it should change
- [ ] 3. Read the repo profile: agent per role, commands, gates before a push
- [ ] 4. Group the tasks into batches, then build every task of the batch
- [ ] 5. Once per batch: full checks, gates, draft PR, review, fix rounds (three at most), verification
- [ ] 6. CI green, PR ready, merged into the base branch
- [ ] 7. Next batch, until every task is merged, ready or blocked; then the report
```

### 1. Size the work

Say the size, its ritual and, for a Large job, the batches to the owner in one line before anything else, even when the question was narrower (which model, which agent). The rituals name roles (tester, engineer, security audit, data audit). The profile says which agent plays each one in this repo.

| Size | Signs | Ritual |
|---|---|---|
| Small | bug with a clear cause, 1-3 files, no migration, route, auth, SQL or customer data | One Sonnet engineer writes the failing test, commits it, then writes the fix. Draft PR, the review bot reviews, CI green, merge. No reviewer, verifier or audit agents. |
| Documents | only prose: documents, ADRs, skills, READMEs. Not a hook, a workflow, a setting, a gate, an agent's permissions or anything a program runs | One engineer writes it, with no tester. Full checks once (a repo may test its documents), `blind-reviewer` once, CI, merge. No `blind-verifier`, no audits. |
| Medium | cause unclear, a feature that fits one PR, touches a route, auth or SQL | `mattpocock-skills:diagnosing-bugs` first if the cause is unclear. Tester writes RED, engineer makes it GREEN (one agent does both when the change is mechanical: rules, "Briefing agents"). The security and data audits when the diff touches what they audit. `blind-reviewer`, then `blind-verifier`, before the PR leaves draft. Then merge. |
| Large | several PRs, a migration, an architecture decision, an ambiguous spec, more than one repository | Spec and tickets first, or the approved spec as it is. `Plan` for ports and files, one lane per area of the repo, the tasks grouped into batches. A batch of more than about 10 files with no plan and no finished sibling to copy gets its own `Plan` first (rules, "Batches"). One PR per batch, with its audits, one review and one verification, merged when it passes so the next batch starts from the updated base. Optional overnight supervisor. |

The single agent in the Small ritual is a deliberate exception to a tester/engineer pair the repo's `CLAUDE.md` may ask for. TDD still holds because the RED commit comes before the fix. For a one-line fix, a pair only means loading the same context twice.

A Small PR never leaves draft, and so never merges, with no review at all: when the repo has no review bot, or the bot stays silent (rules, "PR and CI"), `blind-reviewer` reviews the range.

Each batch of a Large job runs the Medium ritual (Documents, when it is only prose) once, for all its tasks together. The job starts from its spec, and there are two ways in:

- **The spec or brief is already approved.** Use it as it is (numbering its criteria is not rewriting them). Read it whole, group its tasks into batches, and ask the owner only where it leaves a decision open, before the first agent starts. A list of PRs in the spec is a list of tasks: group it too, unless the spec says why a PR must land alone. Writing a second spec reopens what the owner already decided.
- **No spec yet.** `mattpocock-skills:to-spec` and `to-tickets` are owner-invoked: only the owner can run them (`/mattpocock-skills:to-spec`). Ask for that, or write the spec and the tickets yourself as markdown in `.scratch/specs/` and get the owner's approval before any agent starts.

When the job crosses two repositories (a library and its consumer), follow "Two repositories" in the rules.

When it sits between two sizes, take the smaller one and move up when a finding demands it. Ceremony costs tokens and the owner's attention, so it has to be earned by risk: an auth route earns a security audit, a typo does not.

### 2. Pick the session model

The owner asks this every time, so answer it explicitly:

- Start on **Sonnet**. Most sessions execute decisions that were already made.
- Use **Opus** only when this session will itself decide the architecture of several PRs. Designing new ports, a migration or the PR split counts as deciding. Running a plan that was already approved does not. `Plan` inherits the session model, so a Large job that still needs its ports shaped wants an Opus session at least until `Plan` is done.
- An overnight supervisor runs on **Sonnet**. **Fable** almost never.
- **One session per batch**, when the job has more than one (rules, "Session length").

Expensive judgment does not depend on the session model. It lives in the agents pinned to Opus (`blind-reviewer` and the repo's judgment audits). Agent models are fixed in their frontmatter: never pass `model` on an Agent call. Where the repo has `.claude/hooks/agent-model-guard.sh`, the hook refuses a model above the pin; elsewhere nothing refuses it, and the rule is yours to keep. The full role table is in [references/models.md](references/models.md).

### 3. Read the repo profile

Read `.claude/deliver.md` at the repo root. It answers, for this repo: the agent for each role, the test-environment command, the affected-tests command, the full checks, the base branch, the gates before a push, the reviewer, whether a review bot comments, and the CI notes. The format is in [references/profile.md](references/profile.md).

Without a profile, build one from the repo before any agent starts: list `.claude/agents/`, read `CLAUDE.md`, `.claude/settings.json`, `.claude/hooks/` and the git hooks, and ask the owner only what those leave unanswered (headless: write the assumption in the report). Save it as `.scratch/deliver-profile.md` and tell the owner it is ready to become `.claude/deliver.md`. The step is done when every field of the format has a value or an explicit "none". The Merge field of a profile you built is always "owner": the method you found goes in the report as a proposal, and only the owner writes it into `.claude/deliver.md`.

A piece this skill expects may be missing in a repo (a generic agent in a manual install without the agent files, the model guard hook, an ignored `.scratch/`). The same reference says what to do for each.

### 4-7. Run it

Follow the rules in [references/rules.md](references/rules.md). They hold at every size; each one is there because skipping it once cost a PR or real money. The ones most often missed:

- Agents run only the affected tests. The full checks run once per batch, never once per task.
- Never resume an idle agent with a large context: start a fresh one with the findings.
- The test commit comes before the fix it pins. Check the order before any review.
- Know the gates before the first push. A repo hook may refuse `git push` or `gh pr create` until a gate has passed for the exact HEAD SHA, so the gate runs before the draft PR exists and again after every fix round. A refused push is answered by running the gate the profile names on the new HEAD.
- The audits, `blind-reviewer` and the bot's wait go out together on the draft's SHA, then the deltas together; the verifier starts after the deltas, alongside the CI.
- Gather every finding of a round (review bot, audits, reviewer, verifier) into one fix prompt per lane. Only a high or medium finding or an unmet AC opens a round. At most three rounds, then that task is blocked, leaves the batch, and the job moves to the tasks that do not depend on it.
- Open the PR as a draft, against the profile's base branch, when the whole batch is built and the gates passed. `gh pr ready` only at the end.
- A branch with an open PR gets its CI from the `pull_request` event. Wait with `ci-watcher`, never by reading logs yourself.
- Merge a PR only when all of rules, "Merge", holds, by the profile's merge method. Then start the next batch from the updated base branch.
- A stack exists only while a PR waits for a merge that is not the session's. Retarget the next PR to the base branch after each merge.

Medium and large jobs get a per-job review checklist at `.scratch/review/REVIEW.md`. Template and sample rows: [references/review-checklist.md](references/review-checklist.md).

For one worked example of each size, see [references/examples.md](references/examples.md).

## Running headless (`claude -p`)

A headless session ends as soon as a turn ends without a pending tool call. So run every agent in the foreground (`run_in_background: false`, several in one message when independent), wait for CI with `ci-watcher` or a foreground `gh run watch <id> --exit-status`, and never end a turn waiting for a notification.

## Finish

The job is finished when every task of it is merged, ready (the merge is the owner's) or blocked. Write `.scratch/reports/<job>.md` whose first line is exactly one of these, the first that applies from the bottom up (`BLOCKED` wins over `READY`, `READY` over `MERGED`):

- `STATUS: MERGED <pr-url>`: every task landed in the base branch (the last PR's URL).
- `STATUS: READY <pr-url>`: everything passed and the merge is the owner's, because the profile says "owner" or has no merge line.
- `STATUS: BLOCKED <reason>`: at least one task did not land. A PR that waits for a tag counts here: its task line reads `BLOCKED waits for <version>`, it stays a draft, and the session lands it after the tag exists.

Below it, one line per task: its PR (the batch's), `MERGED`, `READY` or `BLOCKED`, and for a blocked one the finding or gate that stopped it and what it needs. Then what was not verified by a machine, with the risk of each item.

Then send the owner a short summary in Portuguese: what was merged, CI result, what the bot and reviewers found, what was not verified, and only the decisions that are really theirs (a blocker, a tag, a release).
