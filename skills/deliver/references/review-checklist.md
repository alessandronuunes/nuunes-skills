# Review checklist: <job name>

Used by the primary blind reviewer. Check only the rows whose trigger matches the diff (usually 3-10 per change). Report each checked row as held or broken with file:line.

| # | Trigger in the diff | Check |
|---|---|---|
| 1 | `focus()`, `tabIndex`, `autoFocus`, dialogs, `disabled` on a focused control | Focus moves only after this user's own action. In-flight buttons use `aria-disabled`. Dialog: initial focus on the safe action, Escape, focus return. |
| 2 | SQL, migrations | The repo's database rules hold (timeouts, what a migration may change, a working rollback where the repo asks for one). Indexes for new WHERE/ORDER BY. Generated query code regenerated. The data audit's verdict exists. |
| 3 | tests touched | A test commit precedes the fix it pins. No test deleted silently. No sleeps or longer timeouts to fix flakiness. AC ids in test titles. |
| 4 | logs, metrics, client events | No document, phone, e-mail or name in labels, events or logs. Closed label sets. |
| 5 | a write guarded by a check (assignee, open) followed by slow I/O | The check is repeated right before the write or inside the transaction. |

Copy the rows above into `.scratch/review/REVIEW.md`, then append the rows of the profile's "Review checklist rows" and the rows this job needs.

Severity: high (one customer's or tenant's data reaches another, privacy rule broken, data loss), medium (AC not met, a11y failure on a new control, race with visible effect), low (the rest). Mark pre-existing findings as such after checking the base.
