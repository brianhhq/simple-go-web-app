resource "aws_vpc" "default" {
  cidr_block                = "${var.cidr_block}"
  enable_dns_hostnames      = "true"
  tags {
    Name                    = "${var.purpose} VPC"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
  }
}

resource "aws_internet_gateway" default {
  vpc_id                      = "${aws_vpc.default.id}"
  tags {
    Name                    = "${var.purpose} IG"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
  }
}
