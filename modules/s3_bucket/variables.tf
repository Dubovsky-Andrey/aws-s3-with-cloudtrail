variable "cloudtrail_bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Versioning configuration for the bucket"
  type = object({
    enabled = bool
  })
  default = {
    enabled = true
  }
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

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. stage, prod)"
  type        = string
}

variable "versioning_enabled" {
  description = "Version of the bucket"
  type        = bool
}

variable "log_retention_days" {
  description = "Number of days to retain CloudTrail logs"
  type        = number
}