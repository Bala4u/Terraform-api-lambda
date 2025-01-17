resource "aws_lambda_function" "example" {
   function_name = "Today_terraform_ServerlessExample"

   # The bucket name as created earlier with "aws s3api create-bucket"
   s3_bucket = "codepipelinejobs"
   s3_key    = "Status-Scope-Master/deviceprovisioning/target/deviceprovisioning-0.0.1-SNAPSHOT.jar"
   handler = "com.sciex.statusscope.deviceprovisioning.function.CreateAssetGroup"
   runtime = "java8"

   role = aws_iam_role.iam_for_lambda.arn
 }
 
 resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

 resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.example.function_name
   principal     = "apigateway.amazonaws.com"

   # The "/*/*" portion grants access from any method on any resource
   # within the API Gateway REST API.
   source_arn = "${aws_api_gateway_rest_api.example.execution_arn}/*/*"
 }