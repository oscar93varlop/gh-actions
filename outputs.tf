output "id_vpc" {
  value = module.networking[0].vpc_id
}

output "sbnt_public" {
  value = module.networking[0].subnet_public
}

# output "ip-web" {
#   value = module.server[0].instance_ip_addr
# }