# Lab 4.3 evidence pointer

Run evidence for Lab 4.3 lived in GitHub Actions artifacts (`grc-evidence-<run_id>`, 90-day retention), not as committed files. Signed durable copies begin in Lab 4.4 (`evidence/lab-4-4/receipt.json`).

## Demonstrating runs (Actions history)

| Result | Branch / PR | Run ID | Notes |
| --- | --- | --- | --- |
| Green | `add-grc-gate` / PR #1 | 38047792618 | First successful GRC gate |
| Red | `demonstrate-sc28-fail` / PR #2 | 38048499224 | SC-28 gate failure demo (encryption removed) |
| Green | `restore-public-access-block` / PR #3 | 38048703503 | Restored public-access block |

OIDC role: `arn:aws:iam::758496865249:role/cgep-grc-gate` (`vars.AWS_ROLE_ARN`).
Workflow: `.github/workflows/grc-gate.yml`. Trust: `terraform/primitives/oidc-trust/`.
