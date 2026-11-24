variable "aws_region" {
  description = "AWS region to deploy the function to."
  type        = string
  default     = "{{.AWS_REGION}}"
}

variable "package_path" {
  description = "Path to the deployment zip, built by `task package`."
  type        = string
  default     = "../build/lambda.zip"
}
