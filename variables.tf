variable "aws_access_key" {
  default = "***************"
}

variable "aws_secret_key" {
  default = "******************"
}

variable "region" {
  default = "us-west-2"
}


variable "accountId" {
  # set aws accountId
  default = "123"
}

variable "aws_s3_key" {
  default = "Status-Scope-Master/deviceprovisioning/target/deviceprovisioning-0.0.1-SNAPSHOT.jar"
}

variable "aws_s3_bucket" {
  default = "codepipelinejobs"
}

variable "lambda_function_handler" {
  default = "com.sciex.statusscope.deviceprovisioning.function.CreateAssetGroup"
}

variable "api_path" {
  default = "/createRule"
}

variable "api_env_stage_name" {
  default = "terraform-lambda-java-stage"
}
