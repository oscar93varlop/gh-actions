# locals {
#   cidr_sn1 = cidrsubnet(var.cidr_block,4,0)
#   cidr_sn2 = cidrsubnet(var.cidr_block,4,2)
#   cidr_sn3 = cidrsubnet(var.cidr_block,4,4)
# }

resource "aws_vpc" "vpc_test" {
  cidr_block = var.cidr_block
}
resource "aws_subnet" "sn_public" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = var.cidr_block_sn_public
   tags = {
    Name = "ac_tf202206-vpc"
  }
}

resource "aws_subnet" "sn_private" {
  vpc_id     = aws_vpc.vpc_test.id
  availability_zone = var.az2
  cidr_block =  var.cidr_block_sn_private
   tags = {
    Name = "ac_tf202206-vpc"
  }
}
resource "aws_subnet" "sn_private-2" {
  vpc_id     = aws_vpc.vpc_test.id
  availability_zone = var.az3
  cidr_block = var.cidr_block_sn_private-2
   tags = {
    Name = "ac_tf202206-vpc"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_test.id

   tags = {
    Name = "ac_tf202206-igw"
  }
}

resource "aws_eip" "eip_test" {
  vpc      = true

   tags = {
    Name = "ac_tf202206-eip"
  }
}
resource "aws_nat_gateway" "nat-gw-test" {
  allocation_id = aws_eip.eip_test.id
  subnet_id     = aws_subnet.sn_private.id

   tags = {
    Name = "ac_tf202206-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


   tags = {
    Name = "ac_tf202206-rtb-public"
  }
}
resource "aws_route_table_association" "rtb-a-public" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rtb-public.id
}

resource "aws_route_table" "rtb-private" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw-test.id
  }


   tags = {
    Name = "ac_tf202206-rtb-private"
  }
}
resource "aws_route_table_association" "rtb-a-private" {
  subnet_id      = aws_subnet.sn_private.id
  route_table_id = aws_route_table.rtb-private.id
}
resource "aws_route_table_association" "rtb-a-private-2" {
  subnet_id      = aws_subnet.sn_private-2.id
  route_table_id = aws_route_table.rtb-private.id
}