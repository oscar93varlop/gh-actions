terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"

    }
  }
}

provider "aws" {
    shared_config_files      = ["/home/ovl93/.aws/config"]
    shared_credentials_files = ["/home/ovl93/.aws/credentials"]
    # profile   = "globery"
  # Configuration options

}

terraform {
  backend "s3" {
    bucket         = "bucket-gh-actions"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
