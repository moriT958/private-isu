terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

##
## Provider
##

provider "aws" {
  region  = local.region
  profile = "iam-morita-personal"

  default_tags {
    tags = {
      Application = "private-isu"
    }
  }
}

##
## Locals
##

locals {
  region      = "ap-northeast-1"
  az          = "ap-northeast-1a"
  vpc_cidr    = "192.168.0.0/16"
  subnet_cidr = "192.168.1.0/24"
  webapp_name = "private-isu-webapp"
  bench_name  = "private-isu-bench"
}

##
## Data Sources
##

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
