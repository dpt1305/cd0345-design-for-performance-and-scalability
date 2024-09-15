# TODO: Define the variable for aws_region
variable "region" {
    description = "Region of lambda function"
    default = "us-east-1"
}
variable "lambda_runtime" {
    description = "Runtime environment of lambda function"
    default = "python3.12"
}