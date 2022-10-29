
variable "cidr_block" {
  default = "10.40.0.0/16"
}
variable "cidr_block_sn_public" {
  default = "10.40.1.0/24"
}
variable "cidr_block_sn_private" {
  default = "10.40.2.0/24"
}
variable "cidr_block_sn_private-2" {
  default = "10.40.3.0/24"
}
# variable "env" {
#     description = "environment : dev or prod"
# }
variable "az2" {
  default = "us-east-1b"
}
variable "az3" {
  default = "us-east-1c"
}