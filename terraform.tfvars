
aws_region           = "us-east-1"
project_name         = "aws-s3-with-cloudtrail"
environment          = "dev"
cloudtrail_bucket    = "aws-s3-with-cloudtrail-2025-1111"
versioning_enabled   = true
enable_encryption    = true
encryption_algorithm = "AES256"

cloudtrail_name               = "aws-s3-with-cloudtrail-2025-1111"
is_multi_region_trail         = true
include_global_service_events = true
enable_log_file_validation    = true
enable_logging                = true
log_retention_days            = 90
is_organization_trail         = false
