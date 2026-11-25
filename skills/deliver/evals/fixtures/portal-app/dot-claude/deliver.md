# Deliver profile: acme-portal

Facts the `deliver` skill reads in this repo.

## Roles

| Role | Agent | Scope |
|---|---|---|
| tester | `api-tester`, `ui-tester` | API tests; component and browser tests |
| engineer | `api-engineer`, `ui-engineer` | `packages/api/`; `packages/ui/` |
| security audit | `security-auditor` | auth, sessions, invites, tenancy |
| data audit | `data-auditor` | migrations and queries |
| commit, push, PR | the session | |

## Commands

- Setup, once per shell: none
- Test environment, per agent: `scripts/test-env.sh up` (prints `export` lines) and `scripts/test-env.sh down`, from the agent's worktree
- Affected tests (inner loop): `pnpm test:changed`
- Full checks (end of batch, verifier and gate): `pnpm lint`, `pnpm typecheck`, `pnpm test`, `pnpm build`

## Git and PR

- Base branch: `develop` (`main` only receives releases, by the owner)
- Worktrees: one per task, under `../portal-wt/<task>`
- PR body: English, in the template of `.github/pull_request_template.md`
- Reviewer: none
- Review bot: yes, on draft PRs, heading "Automated review (bot)"
- Merge: `gh pr merge <n> --squash --match-head-commit <sha>`; the base needs no extra step afterwards except its own CI run, which starts by itself

## Gates before a push

None.

## CI

GitHub Actions runs lint, typecheck, unit tests and build on every PR and on `develop`. Browser tests are not part of it and run locally before `gh pr ready`.

## Brief notes

Interface copy is English; code and commits too.

## Review checklist rows

None.

## Never

Migrations on the `portal` database. Reading `.env*`. A call to a real payment or mail provider. A commit, push or merge outside the base branch flow.
