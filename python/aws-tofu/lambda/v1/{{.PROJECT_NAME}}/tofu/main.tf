provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project = "{{.PROJECT_NAME}}"
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "{{.PROJECT_NAME}}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "xray" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
}

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/{{.PROJECT_NAME}}"
  retention_in_days = 14
}

resource "aws_lambda_function" "this" {
  function_name    = "{{.PROJECT_NAME}}"
  role             = aws_iam_role.lambda.arn
  runtime          = "python3.13"
  handler          = "{{.PYTHON_PACKAGE}}.handler.handler"
  filename         = var.package_path
  source_code_hash = filebase64sha256(var.package_path)

  tracing_config {
    mode = "Active"
  }

  depends_on = [aws_cloudwatch_log_group.lambda]
}
