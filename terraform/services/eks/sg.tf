resource "aws_security_group" "default" {
  name              = "EKS for ${var.purpose}"
  description       = "EKS for ${var.purpose}"
  vpc_id            = "${data.aws_vpc.selected.id}"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["${data.aws_vpc.selected.cidr_block}"]
    description     = "ALL within VPC ${var.vpc_id})"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
