# policies

Rego policies that read a Terraform plan and deny it when a NIST 800-53 control is violated. Empty `deny` set means compliant. Each `# METADATA` block is the GRC bridge: control ID, framework, severity, remediation.

| File | Control | Severity | What it requires | Remediation |
|---|---|---|---|---|
| `sc28_encryption.rego` | SC-28 | high | Every `google_storage_bucket` has a customer-managed encryption key (CMEK) | Add `encryption { default_kms_key_name = ... }` referencing a `google_kms_crypto_key` you control |
| `ac3_no_public.rego` | AC-3 | critical | GCS buckets locked down; firewalls must not open ports 22 or 3389 to the world | Set `uniform_bucket_level_access = true` and `public_access_prevention = "enforced"`. For firewalls, narrow `source_ranges` or remove the rule |
| `cm6_required_tags.rego` | CM-6 | medium | Every taggable resource carries the four required labels | Add `project`, `environment`, `managed_by`, `compliance_scope` |

Tests live in `tests/`. Each policy has a passing fixture and at least one failing fixture. Run with `opa test -v policies/`.

The throwaway plan-only fixture is `terraform/primitives/policy-fixture/`. Never applied.
