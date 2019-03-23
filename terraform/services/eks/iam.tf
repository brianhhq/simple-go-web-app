resource "aws_iam_role" "default" {
  name = "EKSRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    Name                    = "EKS role for ${var.purpose}"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
    Purpose                 = "${var.purpose}"
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  role       = "${aws_iam_role.default.name}"
  policy_arn = "${data.aws_iam_policy.AmazonEKSClusterPolicy.arn}"
}
resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  role       = "${aws_iam_role.default.name}"
  policy_arn = "${data.aws_iam_policy.AmazonEKSServicePolicy.arn}"
}
