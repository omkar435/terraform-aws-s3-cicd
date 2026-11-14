
# Create S3 bucket

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform-S3-Bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

# Enable bucket versioning

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "sample_file" {
  bucket = aws_s3_bucket.my_bucket.id

  key    = "test-data/sample-data.txt"
  source = "${path.module}/sample-data.txt"

  etag         = filemd5("${path.module}/sample-data.txt")
  content_type = "text/plain"
}