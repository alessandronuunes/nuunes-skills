# Acme Portal

Node and TypeScript web app: a React front-end and a REST API with accounts, invites and roles. Each organisation is a tenant.

- Tests: `pnpm test --filter <package>`; each worktree uses its own database through `PORTAL_TEST_DB=portal_test_<wt>`. Inner loop: `pnpm test:changed`. The full suite runs in CI.
- Static checks: `pnpm lint`, `pnpm typecheck`, `pnpm build`.
- TDD always: the failing test comes before the implementation.
- Git: `develop` is the base branch and every PR targets it; `main` only receives releases, by the owner. A PR merges with `gh pr merge`.
- Never run migrations on the `portal` database, never read `.env*`, never call a real payment or mail provider from a test or an agent.
