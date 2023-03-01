terraform {
  backend "s3" {
    bucket  = "myaccount-backend-thangap01"
    region = "us-east-1"
    key     = "global/s3/terraform.tfstate"
    #dynamo db details
    dynamodb_table = "terraform01-up-and-running-locks"
    encrypt        = true

  }
}

