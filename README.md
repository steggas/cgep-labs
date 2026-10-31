# cgep-labs

Personal lab workspace for the Certified GRC Engineer Practitioner (CGE-P).

Every lab drops code under `terraform/` (or `scripts/` / policies in later labs) and captured proof under `evidence/lab-X-Y/`. The published copy on GitHub is the version that gets reviewed.

- Lab 2.3: `terraform/primitives/compliant-s3`
- Lab 2.4: `terraform/modules/compliant-gcs-bucket` (consumers: `terraform/primitives/compliant-gcs`, `compliant-gcs-prod`, `compliant-gcs-negative`)
- Lab 2.5: `terraform/primitives/evidence-vault` + `scripts/capture-evidence.sh` (receipt: `evidence/lab-2-5/receipt.json`)
- Lab 3.3: `policies/` (SC-28, AC-3, CM-6) + `terraform/primitives/policy-fixture` (evidence: `evidence/lab-3-3/opa-test-results.json`)
- Lab 3.4: `policies/*_aws.rego` (SC-28, AC-3, CM-6 AWS variants) + `scripts/policy-gate.sh` (evidence: `evidence/lab-3-4/conftest-pass.json`, `conftest-fail.json`, `conftest-results.json`)
- Lab 4.3: `.github/workflows/grc-gate.yml` (plan, Conftest, tfsec on every PR) + `terraform/primitives/oidc-trust` (evidence: `grc-evidence-<run_id>` Actions artifact per run)
- Lab 4.4: Cosign keyless signing in `.github/workflows/grc-gate.yml` + `scripts/verify-evidence.sh` (signed bundles in the evidence vault under `runs/<run_id>/`; receipt: `evidence/lab-4-4/receipt.json`)
- Lab 5.2: `terraform/baselines/aws` (CloudTrail + Security Hub NIST 800-53 / FSBP; evidence: `evidence/lab-5-2/security-hub-findings.json`)
- Lab 5.4: `terraform/baselines/gcp` (Org Policy + WIF + Data Access logs; evidence: `evidence/lab-5-4/iam-policy.json`; demo workflow: `.github/workflows/gcp-wif-demo.yml`)
