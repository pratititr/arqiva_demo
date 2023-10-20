resource "aws_s3_object" "example_object" {
  bucket       = var.bucket_name
  key          = var.filename
  source       = var.file_path
  acl          = "public-read"
  content_type = "text/html"
}