module "s3_bucket" {
  source               = "./modules/s3_bucket"
  cloudtrail_bucket    = var.cloudtrail_bucket
  project_name         = var.project_name
  environment          = var.environment
  versioning_enabled   = var.versioning_enabled
  enable_encryption    = var.enable_encryption
  encryption_algorithm = var.encryption_algorithm
  log_retention_days   = var.log_retention_days
}

module "cloudtrail" {
  source = "./modules/cloudtrail"

  depends_on        = [module.s3_bucket]
  cloudtrail_name   = var.cloudtrail_name
  cloudtrail_bucket = module.s3_bucket.bucket_id
  project_name      = var.project_name
  environment       = var.environment

  is_multi_region_trail         = var.is_multi_region_trail
  include_global_service_events = var.include_global_service_events
  enable_log_file_validation    = var.enable_log_file_validation
  enable_logging                = var.enable_logging
  is_organization_trail         = var.is_organization_trail
}