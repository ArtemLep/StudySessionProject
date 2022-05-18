resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "${var.tag}-VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_cidr
  cidr_block = var.pub_cidr
  tags = {
    "Name" = "${var.tag} Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_cidr
  cidr_block = var.prv_cidr
  tags = {
    "Name" = "${var.tag} Private Subnet"
  }
}

#NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  connectivity_type = "private"
  subnet_id         = var.prv_cidr
  tags = {
    Name = "NAT-${var.tag}"
  }
}
# Creating Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id =var.vpc_cidr
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InternetGW.id
  }

  tags = {
    Name = "Public-${var.tag}-Table"
  }
}
# Creating Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_cidr
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "Private-${var.tag}-Table"
  }
}
resource "aws_internet_gateway" "InternetGW" {
  vpc_id = var.vpc_cidr
  tags = {
    "Name" = "Internet GW"
  }
}
resource "aws_eip" "Elastic_IP" {
  vpc = true
  depends_on = [

    aws_internet_gateway.InternetGW

  ]
}




