resource "aws_subnet" "private" {
  count                     = "${length(var.availability_zones)}"
  vpc_id                    = "${aws_vpc.default.id}"
  cidr_block                = "${cidrsubnet(var.cidr_block,  ceil(log(length(data.aws_availability_zones.available.names) * 3, 2)), length(data.aws_availability_zones.available.names) + count.index)}"
  map_public_ip_on_launch   = false
  availability_zone         = "${element(var.availability_zones, count.index)}"
  tags {
    Name                    = "${var.purpose} Private ${element(var.availability_zones, count.index)}"
    Tier                    = "Private"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
    Purpose               = "${var.purpose}"
  }
}

resource "aws_route_table" "private" {
  count                     = "${length(var.availability_zones)}"
  vpc_id                    = "${aws_vpc.default.id}"

  route {
    cidr_block              = "0.0.0.0/0"
    nat_gateway_id          = "${element(aws_nat_gateway.default.*.id, count.index)}"
  }

  tags {
    Name                    = "${element(var.availability_zones, count.index)} Private RT for ${var.purpose}"
    Tier                    = "Private"
    Environment             = "${var.environment}"
    Owner                   = "${var.owner}"
    Purpose               = "${var.purpose}"
  }
}

resource "aws_route_table_association" "private" {
  count                     = "${length(var.availability_zones)}"
  subnet_id                 = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id            = "${element(aws_route_table.private.*.id, count.index)}"
}
