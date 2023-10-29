# Setup Logging Bucket

resource "aws_s3_bucket" "log_bucket" {
  bucket = "ctl-tf-state-lock-demo2"
}




