  resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block = "10.0.0.0/20"

    map_public_ip_on_launch = true

    availability_zone = format("%sa", var.aws_region)

    tags = {
    "Name" = format("%s-public-1a", var.cluster_name)
    }
  }

resource "aws_route_table_association" "public_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table_association.gw_route_table.id
  
}

resource "aws_route_table_associate" "public_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.gw_route_table.id
}
