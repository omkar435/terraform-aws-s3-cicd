
output "s3_bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.my_bucket.arn

}

output "s3_bucket_region" {
  description = "S3 bucket region"
  value       = var.aws_region
}
