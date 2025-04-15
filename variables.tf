variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. stage, prod)"
  type        = string
}

variable "versioning_enabled" {
  description = "versioning of the bucket"
  type        = bool
}

variable "enable_encryption" {
  description = "Enable server-side encryption for the bucket"
  type        = bool
  default     = false
}

variable "encryption_algorithm" {
  description = "The server-side encryption algorithm to use (e.g., AES256 or aws:kms)"
  type        = string
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail"
  type        = string
}

variable "cloudtrail_bucket" {
  description = "Name of the S3 bucket for CloudTrail logs"
  type        = string
}

variable "is_multi_region_trail" {
  description = "Whether the trail is created in the current region or in all regions"
  type        = bool
}

variable "include_global_service_events" {
  description = "Whether the trail is created in the current region or in all regions"
  type        = bool
}

variable "enable_log_file_validation" {
  description = "Whether log file integrity validation is enabled on the trail"
  type        = bool
}

variable "enable_logging" {
  description = "Whether the configuration recorder should be enabled"
  type        = bool
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
}

variable "is_organization_trail" {
  description = "Whether the trail is an organization trail"
  type        = bool
}
