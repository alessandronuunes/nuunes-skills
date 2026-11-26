#!/usr/bin/env bash
set -euo pipefail
fixture="$(cd "$(dirname "${BASH_SOURCE[0]}")/../fixtures/portal-app" && pwd)"
cp "$fixture/CLAUDE.md" .
mkdir -p .claude .scratch/specs
cp -R "$fixture/dot-claude/." .claude/
cat > .scratch/specs/012-customer-status-filter.md <<'SPEC'
# 012 Customer list: filter by status

## Acceptance criteria

- C1: The customer list shows a status filter with the options Active, Suspended and Closed.
- C2: Selecting a status shows only customers with that status and keeps the current sort.
- C3: Clearing the filter shows every customer again.
- C4: When no customer matches the selected status, the list shows the empty state, not a blank table.
SPEC
