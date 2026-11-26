# One example per size

The first three are from a repo whose profile maps tester and engineer to `api-tester`/`ui-tester` and `api-engineer`/`ui-engineer`. The fourth is from a repo with its own agents and a gate.

## Small

> "Dá para criar o cargo "Supervisor " com espaço no fim, e ele vira um segundo cargo ao lado de "Supervisor"."

The cause is confirmed: the role form schema does not trim the name before validation. Two files (the schema and its test), with no SQL, route, auth or customer data. Session on Sonnet. One engineer (`ui-engineer`) writes the failing test for a trailing space and commits it, then adds the trim and commits again. Draft PR, read the review bot's comment (or run `blind-reviewer` if none arrives), fix its high and medium findings if any, CI green, `gh pr ready`, merge by the profile's method.

Things that look small but are not: deleting or retaining customer data (privacy, Medium at least, with the security and data audits), and anything that changes a query.

## Medium

> "Depois de trocar de aba, a identificação mostra o assinante de outra conversa."

The cause is unclear and the bug crosses a route and client cache keys. Session on Sonnet. Run `mattpocock-skills:diagnosing-bugs` to a reproducible cause, and write the spec with numbered criteria in `.scratch/specs/` from the report. Then the testers write RED, and the engineers make it GREEN. The security audit runs, because one customer's data could reach another. Draft PR. `blind-reviewer` gets a `REVIEW.md` with a stale-read row. One fix round that gathers the bot's and the reviewer's findings. `blind-verifier` on the final SHA. CI green, `gh pr ready`, merge, then the base branch's own CI run.

## Large

> "Adicionar um novo provedor de chat."

Several PRs, a migration and new ports, and no spec yet. Session on Opus, because it decides the architecture across PRs. The owner runs `to-spec` and `to-tickets` (or the session writes both in `.scratch/specs/` and the owner approves). Read the provider skill first, and have `Plan` shape the ports. The data audit reviews the migration. API and UI lanes work in separate worktrees. Six tasks make two batches: the migration with its table and writer alone (it is deployed before the code that uses it), then ports, driver, settings and screen as four tasks on one branch. In each batch the agents run only the affected tests of their task, and the API and UI tasks of the second batch build in parallel because neither needs the other's output (the UI task that calls a new endpoint would start after it). The full checks run once, at the end; then one dispatch sends the audits, `blind-reviewer` and the bot's wait together on the draft's SHA, one fix round gathers all their findings, one message carries the deltas (the reviewer gets the delta of every fix range; an audit gets one when the fix touched what it audits or it raised a finding), and `blind-verifier` starts after them, alongside the CI of the final SHA. The first batch is merged before the second starts, in a new session that reads `.scratch/state/`. The job ends with the provider in the base branch and one report, not with PRs waiting for the owner. A task still open after three fix rounds leaves its batch, is marked blocked, and the rest goes on. An overnight supervisor on Sonnet may drive the PRs once the plan is approved.

## Large, with an approved spec and two repositories

> "Implemente a entrega 1 dos lançamentos: a arquitetura está aprovada em `.scratch/`."

The spec exists and the owner approved it, so nothing is re-specified: the session reads it whole and groups its tasks into batches. Here they stay apart: one is in another repository and one waits for its tag. It executes a decided plan, so it runs on Sonnet. One PR goes to the library (a refusal the driver must report) and two to the consumer. The library has no agents, so `general-purpose` plays tester and engineer there with the library's `CLAUDE.md` in the brief, and it starts from the failing contract test. In parallel, the consumer's tester writes RED against the current library version and a fake client. The consumer's profile lists a gate that stamps the HEAD SHA, so each round there is: commits, gate, push, and the draft PR opens only after the first stamp. Its profile says no review bot, so `blind-reviewer` runs without a wait. The library has no profile, so its PR stops at `STATUS: READY` with the version to tag; the owner merges and tags it, the one step that waits for a person. Then the consumer raises its constraint as the last commit of its PR. The consumer's profile says its hook refuses `gh pr merge`, so the consumer PR that does not need the new version lands by the push the profile names, and the one that does stays in draft until the tag exists.
