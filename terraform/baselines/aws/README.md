# AWS security services baseline

Account-level continuous monitoring for Lab 5.2. CloudTrail and Security Hub keep producing evidence when nobody is pushing code.

| Service | Controls | What it does here |
| --- | --- | --- |
| CloudTrail (`cgep-lab-mgmt`, multi-region, log-file validation) | AU-2, AU-12, AU-10 | Records management events to a dedicated S3 bucket. `enable_log_file_validation = true` gives AU-10 (integrity of audit information) via hourly digests. |
| Security Hub (NIST 800-53 Rev 5 + AWS Foundational Security Best Practices) | RA-5, SI-4 | Aggregates account findings into one normalized JSON feed. Evidence: `evidence/lab-5-2/security-hub-findings.json`. |
| AWS Config | CM-2, CM-6, CM-8 | Not deployed. Left out of this lab (guide treats Config as optional). Security Hub still surfaces the gap as a finding when Config is missing. |

Enabling Security Hub also subscribed the CIS AWS Foundations Benchmark via default standards. That standard is not in this Terraform; unsubscribe it in the console if you want to stop those checks from billing.
