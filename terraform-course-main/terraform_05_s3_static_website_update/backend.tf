# Setup backend using AWS S3 (Remote State File) and DynamoDB (lock)
terraform {
  backend "s3" {
    bucket         = "ctl-tf-state-lock-demo2"
    key            = "s32"
    region         = "us-east-1"
    dynamodb_table = "terra"
  }
}

