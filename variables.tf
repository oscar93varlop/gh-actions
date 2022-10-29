
# variable "cidr_block" {
#   default = "10.0.0.0/16"
# }
# variable "cidr_block_sn_public" {
#   default = "10.0.1.0/24"
# }
# variable "env" {
#     description = "environment : dev or prod"
# }
# #------------------------variables RDS ---------------------------
# variable "name_user_db" {
#   default = "testg"
# }

# variable "name_db" {
#   default = "testg"
# }
# variable "passwd_user_db" {
#   default = "testg"
# }

# variable "engine_db" {
#   default = "mysql"
# }

# variable "port_db" {
#   default = "3306"
# }
# variable "storage_db" {
#     type = map
#     description = "Image for dev or prod"
#     default = {
#         dev = 20
#         prod = 50
#     }
# }

# variable "type_db" {
#     type = map
#     description = "Type BD for dev or prod"
#     default = {
#         dev = "db.t2.micro"
#         prod = "db.t3.medium"
#     }
# }

# #------------------------------variables EC2--------------------------
# variable "type_ec2" {
#     type = map
#     description = "Image for dev or prod"
#     default = {
#         dev = "t2.micro"
#         prod = "t3.medium"
#     }
# }
