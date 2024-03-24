resource "aws_vpc" "elasticsearch_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "${var.environment}_vpc"
  }
}

resource "aws_subnet" "public_subnets" {
 count             = length(var.public_subnet_cidrs)
 vpc_id            = aws_vpc.elasticsearch_vpc.id
 cidr_block        = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 map_public_ip_on_launch = true
 
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count              = length(var.private_subnet_cidrs)
 vpc_id             = aws_vpc.elasticsearch_vpc.id
 cidr_block         = element(var.private_subnet_cidrs, count.index)
 availability_zone  = element(var.azs, count.index)
 
 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
}

resource "aws_internet_gateway" "elasticsearch_gateway" {
  vpc_id = aws_vpc.elasticsearch_vpc.id

  tags = {
    Name = "${var.environment}_gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.elasticsearch_vpc.id

  route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.elasticsearch_gateway.id
  }
  
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count          = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_route_table.id
}