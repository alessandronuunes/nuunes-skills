# Deliver profile: billing-gateway

Facts the `deliver` skill reads in this repo.

## Roles

| Role | Agent | Scope |
|---|---|---|
| tester | `test-engineer` | every Pest test, fixtures and factories |
| engineer | `backend-engineer`, `frontend-engineer` | `app/`, `database/`, `routes/`, `config/`; `resources/js/` |
| security audit | `architecture-reviewer` | tenancy, security and billing-system safety. It runs inside the gate |
| data audit | `architecture-reviewer` | data and model, same report |
| commit, push, PR | `pr-ops` | |

`frontend-reviewer` joins the gate when the branch touches `resources/js/`.

## Commands

- Setup, once per shell: none
- Test environment, per agent: no up or down command. Each worktree uses its own database: `(cd <wt> && DB_DATABASE=billing_gateway_testing_<wt> php artisan test --compact <file>)`
- Affected tests (inner loop): `composer test:changed`
- Full checks (verifier and gate): `composer lint:check`, `composer rector:check`, `composer types:check`, `composer test:changed`, `bun run check`, `bun run types:check`, `bun run build`. The whole suite runs only in GitHub Actions

## Git and PR

- Base branch: `develop` (always pass `--base develop`; GitHub's default here is `main`)
- Worktrees: one per task, set up by the `billing-worktree-flow` skill
- PR body: pt-BR, in the template of `.github/pull_request_template.md`
- Reviewer: none
- Review bot: no
- Merge: the hook refuses `gh pr merge`. The session runs, from any worktree: `git fetch origin && git push origin <reviewed-sha>:refs/heads/develop`. The remote refuses a non-fast-forward. GitHub closes the PR as merged

## Gates before a push

`.claude/hooks/git-guard.sh` refuses the push of a feature branch, and the creation of its PR, unless the exact HEAD SHA has a review stamp. The `billing-feature-gate` skill writes the stamp, run in the branch's worktree: `composer test:changed`, `bun run build`, then the architecture review, and the stamp only with no open high or medium finding. Any new commit voids the stamp. The same hook refuses `--no-verify`, a PR without `--base`, a PR merge and any commit or push on `main`. `BILLING_SKIP_REVIEW=1` and `BILLING_ALLOW_MAIN_PUSH=1` are the owner's.

## CI

GitHub Actions runs the whole suite on every PR. Nothing is dispatched by hand.

## Brief notes

- PHP: read the `billing-backend` skill. Tests: `billing-testing`. `resources/js/`: `billing-frontend`.
- Interface copy is pt-BR with its diacritics; code is English.

## Review checklist rows

| Trigger in the diff | Check |
|---|---|
| a team id read by new code | It comes from the route, the session or the API key, never from the request body. A test proves one team cannot reach another's row. |
| a billing-system error reaches a response or a screen | The billing system's `reason` goes through untouched in `{code, reason, retryable, outcome}`. |
| a write to a billing system | It carries `actor` and `Idempotency-Key` and is never retried on its own. |
| credentials, API keys, CPF | billing-system credentials encrypted, API keys stored as a hash, CPF and secrets redacted in logs, metrics and audit. |
| a migration | It has a working `down()`. |

## Never

`migrate:fresh`, `db:wipe` or a migration on the `billing_gateway` database. A call to a real billing system. Reading `.env*`. A commit, push or merge on `main`.
