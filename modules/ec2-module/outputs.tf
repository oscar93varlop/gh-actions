output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}

output "id_intance" {
  value = aws_instance.web.id
}