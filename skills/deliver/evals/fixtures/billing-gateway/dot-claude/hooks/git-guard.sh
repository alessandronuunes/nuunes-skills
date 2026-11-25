#!/usr/bin/env bash
# PreToolUse hook (matcher Bash): the git flow guard of the gateway.
# Fixture for the deliver evals: the header describes the guard, the body is inert.
#
# It refuses:
#   - a commit or a push on main
#   - a PR created without --base, a PR merge, --no-verify
#   - the push of a feature branch, and the creation of its PR, when the HEAD commit has no
#     review stamp. The billing-feature-gate skill writes the stamp for the exact SHA, and any
#     new commit needs the gate again. BILLING_SKIP_REVIEW=1 waives it and belongs to the owner.
#
# Message on a missing stamp:
#   Bloqueado pelo fluxo git do gateway: o commit <sha> nao tem selo de revisao.
#   Rode o billing-feature-gate na worktree da branch antes de subir ou abrir a PR.
exit 0
