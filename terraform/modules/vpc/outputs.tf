output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}
output "private_subnet_ids" {
  value = ["${aws_subnet.private.*.id}"]
}
output "vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "aws_nat_gateways" {
  value = ["${aws_nat_gateway.default.*.public_ip}"]
}
