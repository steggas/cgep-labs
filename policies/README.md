# policies

Rego policies that read a Terraform plan and deny it when a NIST 800-53 control is violated. Empty `deny` set means compliant. Each `# METADATA` block is the GRC bridge: control ID, framework, severity, remediation.

Same three control IDs on two clouds. The control ID travels; the resource-type check does not — so each control has a GCP file and an AWS file.

| File | Cloud | Control | Severity | What it requires |
|---|---|---|---|---|
| `sc28_encryption.rego` | GCP | SC-28 | high | Every `google_storage_bucket` has a CMEK `encryption` block |
| `sc28_encryption_aws.rego` | AWS | SC-28 | high | Every `aws_s3_bucket` has a matching `aws_s3_bucket_server_side_encryption_configuration` (matched by reference) |
| `ac3_no_public.rego` | GCP | AC-3 | critical | GCS buckets locked down; firewalls must not open 22/3389 to the world |
| `ac3_no_public_aws.rego` | AWS | AC-3 | critical | Every `aws_s3_bucket` has a public-access-block with all four flags true |
| `cm6_required_tags.rego` | GCP | CM-6 | medium | Every taggable resource carries the four required labels |
| `cm6_required_tags_aws.rego` | AWS | CM-6 | medium | Every listed AWS type carries Project / Environment / ManagedBy / ComplianceScope (via `tags_all` or `tags`) |

Tests in `tests/` cover the GCP policies (8 fixtures). Run with `opa test -v policies/`.

AWS variants are exercised by Conftest against a real plan — see `scripts/policy-gate.sh` and `evidence/lab-3-4/`.

The throwaway plan-only fixture is `terraform/primitives/policy-fixture/` (GCP). Never applied.
