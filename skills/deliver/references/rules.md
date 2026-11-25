# Rules at every size

Each rule comes with the reason it exists. When a case is not covered, apply the reason. "The profile" is the repo's `.claude/deliver.md` ([profile.md](profile.md)). "Measured" means one job of 11 PRs and 84 agents, about $168 API-equivalent.

## Batches

- **A batch is the unit of PR, review, verification and CI; a task is the unit of commits.** Build every task of the batch on one branch, then test, review and verify the whole once. Why: each PR pays its own reviewer, verifier, documents, fix rounds and CI queue, and those together cost more than the code.
- **Size: up to four tasks, and a diff one reviewer can hold** (about 40 files or 1,500 changed lines, generated files and moved code aside). Close the batch at whichever comes first. Why: measured, a PR of 134 files cost $30 and needed two fix rounds; PRs of 6 to 13 files cost $3 to $7.
- **What stays alone:** a task another one needs released or merged first, another repository, a migration that must be deployed before the code that uses it, and a change of auth, tenant isolation or customer data. A repository-wide change is split by area, not done in one sweep.
- **Inside the batch each task ends GREEN on its affected tests**: its RED commit, its GREEN commit, then only the tests it touched. Nothing else runs between tasks: no full suite, static analysis, review or CI. Why: a full suite per task is most of the waiting, while the affected tests take seconds and stop a broken task 1 from being built on by tasks 2 to 4.
- **At the end of the batch, once, in this order:** full checks by one engineer (fixing what breaks; `git log` per task, or `git bisect`, finds the task), gates, draft PR (CI runs while the reviewer works), audits and review, fix round, documents, delta check, verification.
- **A task that blocks leaves the batch.** Move its commits, and those of the tasks that depend on them, to a branch of their own and go on with the rest; the batch is then reviewed and verified without them. Why: one stuck task must not hold three finished ones.
- **Plan before a wide batch.** More than about 10 files, and neither the ticket nor a finished sibling says which files change and how: one `Plan` agent writes that first, and the briefs point at it. Why: measured, four plans cost $2.9 together, and the PRs built on a plan and a mold were the cheapest of the job.
- **Independent batches run in parallel**, one worktree each, when they touch different files. Use it only when the profile's test environment allows parallel agents.
- **Documents once per batch**, by one agent, in the first fix round (or after a clean review), so the one delta check covers them. A document that a test reads, or that is generated, goes with the code. Why: documents written before the review were rewritten in every round.

## Session length

- **The cap is a setting, not a habit.** `autoCompactWindow` in the owner's Claude Code settings (200000 is a good value) compacts the session and its agents by themselves, so the job goes on unattended. When it is not set, propose it once; never edit the owner's settings. The state file below is what survives a compaction, so write it before a batch ends, not after.
- **One session per batch** when the job has more than one. At the end of each batch update `.scratch/state/<job>.md` (40 lines at most: what landed, next batch, open decisions, authorizations still valid, what was not verified). The next session reads that file and the spec sections of its batch, nothing else. Why: measured, one session for 11 PRs reached 928k tokens and reread 500k on each of its 425 calls.
- **How the next session starts.** With an overnight supervisor, it starts it. Interactive, end with the exact line for the owner to paste. This is the one case where a job may pause between batches. When the owner asked for the job to go on unattended and there is no supervisor, go on in the same session.
- **Decide before building.** Read the whole spec once and ask every open question together, before the first agent starts. Why: a decision taken mid-PR made the tester redo finished tests.
- **Ask for the authorizations of the whole job once, at the start**: the gates and pushes the profile reserves for the owner, and the merge when the profile says "owner". Why: hours of a job were spent waiting for a push. An authorization covers what it names and never replaces a gate.

## Tests

- **TDD, with the order visible in git.** The `test` commit comes before the `fix`/`feat` it pins. Check it with `git log --reverse --format='%h %s' <base>..<head>` before sending a range to review. If the order is wrong, send it back now. Why: the order is the only proof that the test failed without the fix.
- **Each agent gets its own test environment**, brought up with the profile's command from the agent's worktree and taken down before it reports. Never the owner's or a shared database. Why: parallel agents on one database produce phantom failures, and a shared dev service can lock the owner out.
- **The inner loop runs only affected tests** (the profile's affected-tests command). The full checks run once per batch, then in the gate, `blind-verifier` and CI. Use the runner's parallel and quiet modes when it has them. Why: measured, 52% of all agent time was checks, mostly full suites run by engineers and testers.
- **A flaky test is never fixed with a rerun, a sleep or a longer timeout.** One CI rerun is allowed to confirm a flake. After that it becomes a fix prompt: find the cause, or delete the test and give the reason in the report.
- **Every acceptance criterion maps to a check a machine runs**, written down before the code (in the spec, the ticket or the brief): the test title, the browser spec, the script. `blind-verifier` runs them all on the final SHA. A criterion with no runnable check is turned into one (a browser test, a simulator, a recorded fixture), and only when that is impossible is it listed in the report as not verified, with its risk. An approval the repo reserves for the owner (the look of a new screen, for one) is a decision, not a verification: it still happens, on screenshots an agent produced, and never replaces the runnable check. Why: "the owner tries it by hand" made the owner the slowest step of every delivery.
- **A suite can skip silently without its env.** A sub-second pass from a database-backed suite is a skip, not a pass. Verifiers count the skips.

## Briefing agents

- **The session leads; it does not code.** Its work is the size, the briefs, the dispatch, the findings and the decisions. An agent that falls short gets a sharper brief, a smaller slice or the failing case ("Fix rounds" says whether by `SendMessage` or to a fresh agent). The session fixing the code itself hides the gap in the brief and puts unreviewed judgment in the diff.
- One responsibility per prompt. Prompts live in `.scratch/prompts/` and are referenced by absolute path.
- **Use the agents the profile names and the plugin's generic ones.** `general-purpose` is the fallback only for a role with no agent in the repo. An agent the profile names but the session does not list (the session started in a checkout without it) is said to the owner, who restarts the session from the right checkout; headless, fall back and write it in the report. Why: measured, `general-purpose` starts at 44k tokens and a repo agent with a short tool list at 12k, reread on every call.
- **One agent writes RED and then GREEN when the task is mechanical** (a move, a rename, a pattern with a sibling to copy). The tester/engineer pair is for new logic, a write to an external system, auth, or customer data. The RED commit still comes first.
- **A ceiling per agent: about 60 calls or 150k tokens.** The brief says so: at the ceiling, commit, write what is left in the report and stop. A fresh agent takes the rest. Why: testers ran to 150 calls and 360k tokens, and the last calls cost ten times the first.
- **Every brief asks for economy:** group independent reads and commands in one call; `git diff --stat` before any diff, then only the needed hunks; line ranges instead of whole files; check output cut to failures. Paste the spec excerpt and the `file:line` ranges the task needs instead of "read the spec". Why: measured, 87% of calls did one thing, and 15% of the results were 58% of all text read.
- **The final message of an agent is ten lines at most**: status, SHAs, what is left, the report path. The detail goes in the report file. Why: the session rereads every returned line until it ends.
- Every brief says: commit after each step, write the report incrementally, put your real model in `Co-Authored-By`.
- Every brief carries what the profile lists under "Never", and names the repo knowledge the task touches (a provider or integration skill to read first, PT-BR copy that keeps its diacritics).
- Review and verification agents get a SHA to diff, never a checkout of the author's tree, and never the author's prompts or reports. Why: an agent that sees the author's reasoning tends to agree with it.
- The orchestrator does not read long logs. Use `ci-watcher` for CI and `Explore` for wide searches. Why: every log line read by the orchestrator is paid again on each later turn.

## Fix rounds

- **One fix prompt per lane per round.** Gather every finding of the round (review bot, security, data, reviewer, verifier) into one prompt per lane. Why: one PR had about 10 separate fix prompts, and each one paid for its own context.
- **Resume or start fresh.** `SendMessage` only when the agent stopped less than 5 minutes ago, or its context is under about 60k tokens. Otherwise start a fresh agent of the same type with the findings, the fix range and the `file:line` ranges. When its size is unknown, an agent past 30 calls counts as large. Why: a subagent's cache lasts 5 minutes; measured, 69 cold resumes rewrote 50k to 360k tokens each and were 20% of the whole bill.
- **Only a high or medium finding or an unmet AC opens a round.** Low findings ride in a round that is open anyway and touches the same files; otherwise they go into the report, unless the profile or `CLAUDE.md` says every severity must be closed.
- **Small fixes** (one or two findings) go to one agent that writes the failing test and then the fix, not to a tester/engineer pair.
- **At most three rounds.** If a high or medium finding or an unmet AC is still open after the third, stop that task. Push the branch, leave the PR as a draft with the blocker in its body, and mark the task `BLOCKED`. In a batch, the task leaves it ("Batches"). The job goes on with every task that does not depend on it; tasks that do depend on it wait, named in the report.
- **Reviews converge.** From round 3 on, the scope is defects only (no refactors). Send the reviewer only the fix range and the finding ids.

## Review and verification (medium and large; Documents has the review only)

- `blind-reviewer` runs once per batch, fresh, with only the spec path, the range, `.scratch/review/REVIEW.md` and the profile's test-environment command. A delta check goes to the same reviewer while it is warm, else to a fresh `blind-reviewer` with the spec path, its earlier review report, the fix range and the finding ids ("Fix rounds"). A review holds only for the SHA it saw; new commits need a delta check.
- `blind-verifier` runs once per batch, when the review is clean, on the final SHA, in its own detached worktree with its own test env. Its brief always carries the profile's full checks and test-environment command; without them it falls back to the repo's full suite and says so. It runs again only if code changed. It does not run in parallel with the review: a review almost always brings a fix round, which voids the verification. The CI is what runs alongside the review.
- A refactor that must keep behaviour is verified by comparing it with the base. Keep the comparison script in the repo and reuse it; each verifier writing its own spent about 80k output tokens.
- When a round finds something that would recur, add it as a new row to `REVIEW.md` so the next PR checks it.

## Gates before a push

- **Read the gates before the first push.** The profile lists them. Without a profile, read `.claude/settings.json`, `.claude/hooks/` and the git hooks for anything that matches `git push` or `gh pr create`. Why: a hook that refuses the push after the PR was announced costs a round of confusion, and its message is the only clue the next agent gets.
- **A gate bound to a SHA runs again after every fix round.** New commits void its stamp, so the order of a round is: fix commits, gate, push. The gate's own review counts as an audit of the round; fold its findings into the same fix prompt.
- **A gate is passed, never bypassed.** An escape variable or `--no-verify` belongs to the owner. If a gate cannot pass, that is `STATUS: BLOCKED` with the hook's message quoted.

## PR and CI

- Open the PR as a **draft**, against the profile's base branch, once the batch is built, its full checks are green and the gates passed. The audits and the review run on the draft. PR body via `mattpocock-skills:pr`, in the language and template the profile names. Request the profile's reviewer.
- **Review bot.** When the profile says a bot comments on draft PRs, give it at most 15 minutes:

  ```
  for i in $(seq 15); do gh pr view <n> --comments | grep -q '<heading from the profile>' && break; sleep 60; done
  ```

  Interactive: run the loop with `run_in_background: true` and keep working on what does not depend on it; its exit is one notification. Headless: leave the loop out, because a foreground `sleep` can be refused and a turn cannot wait on a notification. There the CI wait is the bot wait: when `ci-watcher` returns, look for the comment once. Then read the comment with `gh pr view <n> --comments` and fold its high and medium findings into the current fix round. On one PR the bot found a medium the primary reviewer missed.
- **The loop serves the first round only**, because it matches any comment with that heading. After a later push, count the bot's comment only when its `createdAt` is newer than the push.
- **No bot, or the loop ends without the comment:** run `blind-reviewer` on the range, so no PR leaves draft unreviewed. When the profile says "no", skip the wait. When the profile is silent, the loop is how you find out; record the answer for the profile.
- CI on a branch with an open PR comes from the `pull_request` event. Dispatching a second run on the same branch only queues behind it or fights it for runners. The profile's CI notes say what CI leaves out (browser tests, for one), and that part runs locally before `gh pr ready`.
- **Stacked PRs:** a stack exists only while a PR waits for a merge that is not the session's (the profile says "owner", or a tag is pending). After each merge, retarget the next PR (`gh pr edit <n> --base <base branch>`) and check that its commits reach the base branch. Otherwise GitHub merges it into the previous branch and the code never lands (it has happened).

## Merge

- **A PR that passed is merged by the session, and the job moves on.** Why: the owner was approving, one by one, PRs that had already passed every check, and the job sat idle between them.
- **All of these hold for the PR's final SHA before the merge:**
  1. CI is green on that SHA, and what CI leaves out (the profile's CI notes) ran locally.
  2. A reviewer that never saw the conversation reviewed it and no high or medium finding is open: `blind-reviewer` for Medium, Large and Documents, the review bot or `blind-reviewer` for Small. A commit after the review needs the delta check first. For Small, when commits came after the bot's last comment and no newer comment exists, `blind-reviewer` reviews the fix range; the bot's earlier comment does not cover them. At any size, when the profile has a review bot, its high and medium findings count as open findings too.
  3. Medium and Large (a batch that is only prose excepted): `blind-verifier` passed on that SHA, every AC met with evidence and zero unexplained skips.
  4. The audits the diff called for returned a verdict with no high or medium finding open.
  5. The profile's gates passed for that SHA.
  6. The base is the profile's base branch and the PR left draft (`gh pr ready`).
  7. The branch contains the current tip of the base branch. If the base moved since CI ran (another task landed), bring the branch up to it first; the new SHA needs CI, the gate and a delta check again and, for Medium and Large, `blind-verifier` again. Why: two lanes green on the same old base can break each other with no textual conflict, and the break would first show on the base branch.
  8. No person stands against it: no `CHANGES_REQUESTED` review, no unresolved review thread, no human comment left unanswered (`gh pr view <n> --json reviewDecision,reviews,comments`). A comment under the profile's review-bot heading is the bot's, even when posted from a person's account, and is handled by condition 2. The profile's reviewer is requested and notified, not waited for; a person's change request is a finding of the next fix round, and a disagreement with it goes to the owner. Why: the owner's merge used to be the moment a colleague's objection was seen.
- **Merge by the profile's method, pinned to the SHA that passed:** `gh pr merge <n> ... --match-head-commit <sha>`, or a push of that exact SHA (`git push origin <sha>:refs/heads/<base>`) where a hook refuses `gh pr merge`. Right before it, `gh pr view <n> --json headRefOid,baseRefName,isDraft` must show that SHA, the profile's base and `false`; anything else sends the PR back to condition 1. Right after it, `gh pr view <n> --json state,mergeCommit` must show `MERGED`: the answer of the command alone is not proof either way. Delete the branch and its worktree only after that and after any PR stacked on it was retargeted. Why: an agent resumed for a late finding can push after the verifier passed, and an unpinned merge lands that commit unseen. When the profile says "owner", or has no merge line, the PR stops at `READY` and the job goes on stacked.
- **Only into the base branch.** Never `main` or a release branch, never a tag, never a release, never a force push, never an admin override of a failing or pending check.
- **After the merge:** run what the profile says the base branch needs (a dispatched CI run, for one) and wait for it with `ci-watcher`. A red base branch is the next task, ahead of everything else: fix it forward through the same ritual, or revert the merge with a PR when the cause is not found in one round. Then start the next batch from the new base. An open branch brought up to the new base gets a new SHA, which voids its CI, gate, review delta and verification: its lane's engineer resolves any conflict and the conditions run again on the new SHA.
- **Low findings do not hold a merge** unless the profile or the repo's `CLAUDE.md` says every severity must be closed. They go into the report, or into the next task of the same job when it touches the same files.
- **What still stops for the owner:** a blocker after three rounds, a decision the spec leaves open, a tag or release, a gate that cannot pass, an approval the repo's `CLAUDE.md` or profile reserves for the owner (visual work, for one), anything in the profile's "Never". Write the question, with its options, in the report and keep working. Ask it only in the final summary, after every task that does not depend on the answer is merged, ready or blocked. Never end a turn on a question while independent work remains. Why: a question ends the turn, and a headless session ends with it.

## Two repositories (library and consumer)

- **Order: library PR, merge, tag, consumer bump.** The library PR lands like any other ("Merge": by its own profile's method, or it stops at `READY`); the tag always waits for a person. The consumer raises its version constraint only after the tag exists, as the last commit of its PR. Why: a consumer merged against an unpublished version fails at install for everyone.
- **The tag belongs to the owner or the library's maintainer.** The library job ends at `STATUS: MERGED` when its profile records a merge method into a base branch other than `main`, and at `STATUS: READY` otherwise, naming the version the consumer waits for. The consumer's work goes on meanwhile.
- **Each repo is its own job**: its own worktree, its own profile, its own ritual and report. The consumer's report names the library PR and version.
- **What runs in parallel.** The consumer's RED tests and implementation run against the current version of the library with a fake of it. What waits for the tag: the constraint bump and any test that needs the new behaviour. Name those as the remaining step in the consumer's PR body and keep that PR in draft until the version exists.
- **The library starts from a failing test.** A bug read in the library's code and never reproduced may not exist. If the test passes without a change, stop and tell the owner before the consumer builds on it.

## Commits

Small and atomic, in English, `type(scope): description` (72 characters at most), no prose body, with the attribution trailer the session provides. Always give an explicit pathspec.
