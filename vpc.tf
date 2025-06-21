# Create a VPC

resource "aws_vpc" "example" {
  cidr_block = "172.16.0.0/24"
  tags = {
      Name = "Okhai New VPC"
  }
}


resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "172.16.0.0/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-private-subnet-2a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "172.16.0.64/26"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "automation-private-subnet-2b"
  }
}


resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "172.16.0.128/26"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "automation-public-subnet-2a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "172.16.0.192/26"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "automation-public-subnet-2b"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "automation-gw"
  }
}

#Create a Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}
