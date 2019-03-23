resource "aws_eip" "default" {
  count             = "${length(var.availability_zones)}"
  vpc               = true
  tags {
    Name            = "NAT GW ${element(var.availability_zones, count.index)} for ${var.purpose}"
    Environment     = "${var.environment}"
    Owner           = "${var.owner}"
    Purpose               = "${var.purpose}"
  }
}

resource "aws_nat_gateway" "default" {
  count             = "${length(var.availability_zones)}"
  allocation_id     = "${element(aws_eip.default.*.id, count.index)}"
  subnet_id         = "${element(aws_subnet.public.*.id, count.index)}"
}
