# Lab 4.4 — Chain of custody

Run `39156648465` signed the Lab 4.3 evidence bundle and stored it at `s3://cgep-lab-grc-evidence-vault-16e2fa24/runs/39156648465/`. `scripts/verify-evidence.sh` printed `Verified OK` and `CHAIN INTACT for run 39156648465`. The receipt is `evidence/lab-4-4/receipt.json`.

| Property | What proves it |
| --- | --- |
| Authenticity | Keyless Cosign signature. The `.sig.bundle` holds a Fulcio certificate bound to this repo's GitHub Actions workflow through OIDC (`https://token.actions.githubusercontent.com`). `cosign verify-blob` returned `Verified OK`. |
| Integrity | SHA-256 sidecar `eb5555ee41fce1c706389754c547c841735d5ee806eae93b3c1146f31643cd44` matches the bundle. Appending `junk` to a local copy changed the hash to `fea1a30af16d225a4cb8f3ff2212d8e72aae7e1e38020e0dec1c78f07e836d10`. Object Lock refused any overwrite of the vault object, so the tampered copy exists only on the laptop. |
| Timeliness | The Rekor transparency-log entry is packed in the same `.sig.bundle`. `cosign verify-blob` checks that entry, which is the record of when the bundle was signed. |
| Preservation | Object Lock retention on the vault object. The receipt's `version_id` is `ZjFJYy.bNucZgsVYlTNU1xpJ.K1j7vJO`. The verify script reads `RetainUntilDate` and fails if that date has passed. |
