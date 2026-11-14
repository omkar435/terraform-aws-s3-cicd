
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "omkar-terraform-cicd-s3-2026"
}
