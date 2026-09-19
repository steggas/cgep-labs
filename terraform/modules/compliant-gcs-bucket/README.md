# compliant-gcs-bucket

Reusable GCS module that locks the security baseline inside the module so consumers cannot switch it off. It enforces **SC-12** (customer-managed KMS keyring and crypto key), **SC-13 / SC-28** (CMEK encryption at rest with scheduled key rotation), **AC-3** (uniform bucket-level access and enforced public access prevention), **AU-11** (object retention policy), and **CM-6** (required compliance labels merged onto every bucket). Callers can choose environment, retention, and naming; they cannot disable those controls.
