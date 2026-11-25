# Models per role

Each agent's model is pinned in its frontmatter, so nobody chooses it per call. Never pass `model` on an Agent call. The four generic agents (`blind-reviewer`, `blind-verifier`, `ci-watcher`, `design-critic`) ship with this plugin already pinned as the table says. Where the repo has a hook such as `.claude/hooks/agent-model-guard.sh` (a repo may or may not have one), it refuses a model above the pin and allows one below it. Agents started inside `Workflow` scripts bypass the hook, so those scripts must not pass `model` either.

Measured on three PRs of one project (about $138 API-equivalent): Opus was 76% of the cost. An engineer on Opus alone cost about $25, while the orchestrating session was about 8%. Execution moved to Sonnet. Judgment stayed on Opus, where a miss costs more than the tokens.

| Role | Agent | Model |
|---|---|---|
| shape ports and files | `Plan` (built-in) | inherits the session (run it from an Opus session) |
| primary blind review | `blind-reviewer` | opus |
| judgment audits (security of the core, migrations and hot-path queries) | the profile's audit agents | opus |
| code and tests | the profile's testers and engineers | sonnet |
| checklist audits (front-end security, a11y) | the profile's audit agents | sonnet |
| blind verification | `blind-verifier` | sonnet |
| UI critique | `design-critic` | sonnet |
| CI wait and log reading | `ci-watcher` | haiku |
| broad read-only search | `Explore` | built-in |

Which agent plays each audit comes from the repo's profile. In a repo whose profile maps the security audit of the core to `security-auditor` and the migrations audit to `data-auditor`, those two are the judgment audits and belong on Opus; a front-end security checklist agent is a checklist audit and belongs on Sonnet.

The pin in a repo agent's frontmatter is the fact; this table is what it should say. An agent with no `model` line inherits the session, and so does `general-purpose`. On an Opus session that runs execution at Opus prices, so name it to the owner.

Use `design-critic` for UI critique, not `general-purpose`: the latter inherits the session model, which may be Opus.

If a Sonnet engineer fails the same AC twice, keep its model. Split the slice smaller, or give `Plan` the failing case. A bigger model on a vague slice just fails more expensively.
