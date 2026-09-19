# compliant-s3

This module enforces SC-28, AU-3, AU-6, CM-6, and AC-3 on a single S3 bucket (plus a paired log bucket): AES-256 encryption at rest, access logging to a dedicated log bucket, required compliance tags via provider `default_tags`, versioning, and a full public-access block.
