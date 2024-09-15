# --------------- 1. Provider
terraform {
	required_providers {
		aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
		}
	}
}

provider "aws" {
	region                   = var.region
	shared_credentials_files = ["~/.aws/credentials"]
	profile                  = "udacity"
}

# ------------------ 2.Role and policies
data "aws_iam_policy_document" "assume_role" {
	statement {
		effect = "Allow"
		principals {
			type        = "Service"
			identifiers = ["lambda.amazonaws.com"]
		}
		actions = ["sts:AssumeRole"]
	}
}

resource "aws_iam_role" "udacity_iam_for_lambda" {
  	name               = "udacity_iam_for_lambda"
  	assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "create_logs_policy" {
  name        = "create_logs_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
			"logs:CreateLogGroup",
			"logs:CreateLogStream",
			"logs:PutLogEvents"
      	]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_create_logs_policy_attachment" {
  role       = aws_iam_role.udacity_iam_for_lambda.name
  policy_arn = aws_iam_policy.create_logs_policy.arn
}
# ------------------ 3.Function
data "archive_file" "lambda" {
  	type        = "zip"
  	source_file = "./greet_lambda.py"
  	output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
	filename      = "lambda_function_payload.zip"
	function_name = "udacity_lambda_function_name"
	role          = aws_iam_role.udacity_iam_for_lambda.arn
	handler       = "greet_lambda.lambda_handler"
	source_code_hash = data.archive_file.lambda.output_base64sha256
	runtime = var.lambda_runtime
}