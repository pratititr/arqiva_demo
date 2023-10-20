provider "aws" {
  region = var.aws_region

  access_key = "XXX"
  secret_key = "XXX"
}

variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region to deploy the infrastructure"
}

module "s3_bucket" {
  source                    = "./modules/s3"
  bucket_name               = "my-unique-bucket-name-demo"
  bucket_acl                = "public-read"
  bucket_ownership_controls = "BucketOwnerPreferred"
  enable_versioning         = "Enabled"
}

module "s3_upload" {
  source      = "./modules/upload_s3"
  bucket_name = "my-unique-bucket-name-demo"
  filename    = "index.html"
  file_path   = "/Users/arpanbarua/Downloads/Pratiti/checkout/arqiva_demo/index.html"
}

module "custom_iam_role" {
  source    = "./modules/iam_role"
  role_name = "arqiva_demo_role_new"
}

module "custom_lambda_function" {
  source        = "./modules/lambda"
  function_name = "my-lambda-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  role_arn      = module.custom_iam_role.custom_role
  file_path     = "/Users/arpanbarua/Downloads/Pratiti/checkout/arqiva_demo/update_index.zip"
}