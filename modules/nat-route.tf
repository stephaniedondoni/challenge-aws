
resource "aws_eip" "vpc_iep" {
  vpc = true
  
  tags = {
      Name = format("%s-eip", var.cluster.name)
  }
}

resource "aws_nat_route" "nat" {

    allocation_id = aws_eip.vpc_iep.allocation_id
    subnet_id     = aws_subnet.public_subnet_1a.id 

    tags = {
      Name = format("%s-nat-route", var.cluster.name)
  }
  
}
