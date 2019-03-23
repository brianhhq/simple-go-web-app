terraform {
  backend "s3" {
    key    = "eks.tfstate"
    region = "ap-northeast-1"
  }
}
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_eks_cluster" "default" {
  name     = "EKS${var.environment}"
  role_arn = "${aws_iam_role.default.arn}"

  vpc_config {
    subnet_ids = ["${data.aws_subnet_ids.public.ids}"]
    security_group_ids = ["${aws_security_group.default.id}"]
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.default.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.default.certificate_authority.0.data}"
}
