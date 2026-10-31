# GCP security services baseline

Lab 5.4 counterpart to the AWS baseline. Preventive where AWS was detective: Org Policy rejects at the API, WIF replaces downloadable keys, Data Access logs record reads that were off by default.

| Play | What | Controls |
| --- | --- | --- |
| Org Policy | `storage.uniformBucketLevelAccess`, `iam.disableServiceAccountKeyCreation`, `compute.requireOsLogin` enforced at project scope | CM-6, AC-2, AC-3 |
| WIF | Pool `github-actions` trusts only `steggas/cgep-labs` via `assertion.repository`; bound to `cgep-grc-gate-sa` (`roles/viewer`) | key-free CI (same OIDC idea as Lab 4.3) |
| Data Access audit logs | Enabled for `storage.googleapis.com`, `cloudkms.googleapis.com`, `iam.googleapis.com` | AU-2 / AU-12 evidence |

**Lesson:** Data Access logs are off by default on GCP. That default is a common audit finding. This baseline turns them on; see `evidence/lab-5-4/iam-policy.json`.

**Demo:** creating a key on `cgep-grc-gate-sa` returns `FAILED_PRECONDITION` / `constraints/iam.disableServiceAccountKeyCreation`. The forbidden action does not happen.

Apply vars: `-var="gcp_project=grc-eng-club" -var="github_repo=steggas/cgep-labs"`.
