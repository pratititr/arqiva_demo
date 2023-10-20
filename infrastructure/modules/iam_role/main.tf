resource "aws_iam_role" "custom_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_full_access" {
  name       = var.role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.custom_role.name]
}

resource "aws_iam_policy_attachment" "lambda_full_access" {
  name       = var.role_name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  roles      = [aws_iam_role.custom_role.name]
}
