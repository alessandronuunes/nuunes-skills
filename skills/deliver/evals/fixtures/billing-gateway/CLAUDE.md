# Billing Gateway

Laravel 13 / PHP 8.5 app with an Inertia + React panel. Web panel and API that post invoices and credits to third-party billing systems through the `acme/billing` Composer package. Each team is a tenant.

- Tests: Pest on PostgreSQL. In a worktree, always with its own database: `(cd <wt> && DB_DATABASE=billing_gateway_testing_<wt> php artisan test --compact <file>)`. End of each step: `composer test:changed`. The full suite runs in GitHub Actions.
- Static checks: `composer lint:check`, `composer rector:check`, `composer types:check`; front: `bun run check`, `bun run types:check`, `bun run build`.
- TDD always: the failing test comes before the implementation.
- Git: `develop` receives the work; `main` only receives the `develop` promotion, merged by the owner. Every PR targets `develop`. A feature branch needs the review stamp of the `billing-feature-gate` skill before it is pushed or gets a PR (`.claude/hooks/git-guard.sh`).
- Never run `migrate:fresh`, `db:wipe` or migrations on the `billing_gateway` database; never call a real billing system from a test or an agent; never read `.env*`.
