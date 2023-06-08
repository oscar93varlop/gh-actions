resource "aws_db_instance" "db-test" {
  allocated_storage    = var.storage_db
  engine               = var.engine_db
  engine_version       = "5.7"
  instance_class       = var.type_db
  name                 = "mydb"
  username             = var.name_user_db
  password             = var.passwd_user_db
  parameter_group_name = "default.mysql5.7"
  port                 = var.port_db
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sbn-private.name
}
resource "aws_db_subnet_group" "sbn-private" {
  name       = "sbn-private"
  subnet_ids = [var.list_subnet[0], var.list_subnet[1] ]

  tags = {
    Name = "My DB subnet group"
  }
}