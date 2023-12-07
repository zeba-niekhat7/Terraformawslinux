terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = var.destination_account_ids
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
  token               = var.aws_session_token

  default_tags {
    tags              = merge(local.mandatory_tags,
      {
        "created-by"  = "terraform"
        "workspace"   = lower(terraform.workspace)
    })
  }
}
