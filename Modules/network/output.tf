output "eip_allocation_id" {
  value = aws_eip.nat.id
}
output "public_ip" {
  value = aws_eip.nat.public_ip
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_cidr" {
  value = aws_subnet.public.cidr_block
}

output "private_subnet_cidr" {
  value = aws_subnet.private.cidr_block
}

output "public_subnet_availability_zone" {
  value = aws_subnet.public.availability_zone
}
