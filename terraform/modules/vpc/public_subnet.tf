resource "aws_route_table" public {
  vpc_id                  = "${aws_vpc.default.id}"

  route {
    cidr_block            = "0.0.0.0/0"
    gateway_id            = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name                  = "${var.purpose} Public RT"
    Tier                  = "Public"
    Environment           = "${var.environment}"
    Owner                 = "${var.owner}"
    Purpose               = "${var.purpose}"
  }
}

resource "aws_subnet" "public" {
  count                   = "${length(var.availability_zones)}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${cidrsubnet(var.cidr_block,  ceil(log(length(data.aws_availability_zones.available.names) * 3, 2)), count.index)}"
  map_public_ip_on_launch = true
  availability_zone       = "${element(var.availability_zones, count.index)}"
  tags {
    Name                  = "${var.purpose} public ${element(var.availability_zones, count.index)}"
    Tier                  = "Public"
    Environment           = "${var.environment}"
    Owner                 = "${var.owner}"
    Purpose               = "${var.purpose}"
  }
}

resource "aws_route_table_association" "public" {
  count                   = "${length(var.availability_zones)}"
  subnet_id               = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id          = "${aws_route_table.public.id}"
}
