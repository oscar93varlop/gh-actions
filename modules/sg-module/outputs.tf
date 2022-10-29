output "sg-test" {
  value = aws_security_group.sg-test.id
}

output "sg-test-db" {
  value = aws_security_group.sg-test-db.id
}