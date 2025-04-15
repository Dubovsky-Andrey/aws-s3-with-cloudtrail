output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.cloudtrail_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.cloudtrail_bucket.arn
}

output "cloudtrail_policy" {
  value = aws_s3_bucket_policy.cloudtrail_policy.policy
}