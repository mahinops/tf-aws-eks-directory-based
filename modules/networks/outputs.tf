output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = [aws_subnet.subnet-public-1.id, aws_subnet.subnet-public-2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.subnet-private-1.id, aws_subnet.subnet-private-2.id]
}

