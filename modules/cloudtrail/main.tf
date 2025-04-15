resource "aws_cloudtrail" "cloudtrail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = var.cloudtrail_bucket
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  enable_log_file_validation    = var.enable_log_file_validation
  enable_logging                = var.enable_logging
  is_organization_trail         = var.is_organization_trail

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
