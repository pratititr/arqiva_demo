resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "example_bucket_owner" {
  bucket = aws_s3_bucket.example_bucket.id
  rule {
    object_ownership = var.bucket_ownership_controls
  }
}

resource "aws_s3_bucket_public_access_block" "example_public_access_block" {
  bucket = aws_s3_bucket.example_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.example_bucket_owner, aws_s3_bucket_public_access_block.example_public_access_block]
  bucket     = aws_s3_bucket.example_bucket.id
  acl        = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = var.enable_versioning
  }
}

/* resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption_type
    }
  }
} */