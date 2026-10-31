# terraform/primitives/compliant-gcs-negative/main.tf
# Negative test: prod with retention_days=30 must fail validation at plan time.
terraform {
  required_version = ">= 1.6"
  required_providers {
    google = { source = "hashicorp/google", version = "~> 5.0" }
  }
}

provider "google" {
  project = "grc-eng-club"
  region  = "us-central1"
}

module "data_bucket" {
  source = "../../modules/compliant-gcs-bucket"

  gcp_project        = "grc-eng-club"
  project_label      = "cgep-lab"
  environment        = "prod"
  retention_days     = 30 # FAILS: prod requires >= 365
  bucket_name_suffix = "should-never-exist"
}

output "attestation" { value = module.data_bucket.compliance_attestation }
output "bucket_url"  { value = module.data_bucket.bucket_url }
output "kms_key_id"  { value = module.data_bucket.kms_key_id }
