resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "eks-vpc-${var.environment}"
    Environment = var.environment
    Project     = var.project  
  }
}

resource "aws_subnet" "subnet-public-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block_1
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "eks-subnet-${var.environment}"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_subnet" "subnet-public-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block_2
  availability_zone = var.availability_zones[1]

  tags = {
    Name        = "eks-subnet-${var.environment}"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block_1
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "eks-subnet-${var.environment}"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block_2
  availability_zone = var.availability_zones[1]

  tags = {
    Name        = "eks-subnet-${var.environment}"
    Environment = var.environment
    Project     = var.project
  }
}

