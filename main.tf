provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "gunama-tfstates"
    key    = "bucket-keys"
    region = "us-east-1"
  }
}
