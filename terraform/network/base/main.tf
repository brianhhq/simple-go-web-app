terraform {
  backend "s3" {
    key    = "network.tfstate"
    region = "ap-northeast-1"
  }
}
provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source                      = "../../modules/vpc"
  cidr_block                  = "${var.cidr_block}"
  purpose                     = "${var.purpose}"
  environment                 = "${var.environment}"
  owner                       = "${var.owner}"
}

output "vpc_id" {
  value                       = ["${module.vpc.vpc_id}"]
}
