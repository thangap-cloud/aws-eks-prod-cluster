terraform {
  backend "s3" {
    bucket          = "thangap2409-backend01-s3"
    region          = "ap-southeast-1"
    key             = "global/s3/terraform.tfstate"
    #dynamo db details
    dynamodb_table  = "tf-state-thangap2409-lock"
    encrypt         = true

  }
}

