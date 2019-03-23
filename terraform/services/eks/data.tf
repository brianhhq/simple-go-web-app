data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}
data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.selected.id}"
  tags {
    Tier                    = "Public"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
  }
}

data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "AmazonEKSServicePolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}
