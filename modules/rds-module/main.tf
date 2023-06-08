resource "aws_rds_cluster" "default" {
  cluster_identifier = var.name_cluster
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name      = "mydb"
  master_username    = var.name_user_db
  master_password    = var.passwd_user_db
  port               = var.port_db
  backtrack_window   = 18000
}
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r4.large"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  db_subnet_group_name = aws_db_subnet_group.sbn-private.name

}
resource "aws_db_subnet_group" "sbn-private" {
  name       = "sbn-private"
  subnet_ids = [var.list_subnet[0], var.list_subnet[1] ]

  tags = {

    Name = "My DB subnet group"
  }
}