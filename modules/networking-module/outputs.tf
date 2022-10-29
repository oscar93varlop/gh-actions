output "subnet_public" {
  value = aws_subnet.sn_public.id
}
output "subnet_private-1" {
  value = aws_subnet.sn_private.id
}
output "subnet_private-2" {
  value = aws_subnet.sn_private-2.id
}

output "vpc_id" {
  value = aws_vpc.vpc_test.id
}
output "vpc_cidr" {
  value = var.cidr_block
}