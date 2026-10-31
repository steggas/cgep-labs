# OSCAL (Lab 6.1)

Machine-readable control claims for the CGE-P labs. An assessor starts here, follows evidence links into the vault, and runs `scripts/verify-evidence.sh`.

| Artifact | Describes | Evidence |
| --- | --- | --- |
| `components/compliant-s3.json` | Terraform module `terraform/primitives/compliant-s3` (Lab 2.3). Implements SC-28, AC-3, AU-3, CM-6. | Signed Lab 4.4 bundle: `s3://cgep-lab-grc-evidence-vault-16e2fa24/runs/39156648465/evidence-39156648465-4aeb62a82124fa7e458d48e75e9ae932c8f24bc1.tar.gz` (receipt: `evidence/lab-4-4/receipt.json`) |
| `profiles/cge-p-minimum.json` | Selects those four controls from NIST 800-53 Rev 5. | Resolved locally with `trestle author profile-resolve` into `.trestle-work/catalogs/cge-p-minimum-resolved/` (authoring only; gitignored). |

Validation output: `evidence/lab-6-1/trestle-validate.txt`.
