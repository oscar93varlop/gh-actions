output "id_vpc" {
  value = module.networking[0].vpc_id
}

output "sbnt_public" {
  value = module.networking[0].subnet_public
}