module "server" {
    count         = 1
    source        = "./modules/ec2-module"
    subnet_public_ec2 = module.networking[0].subnet_public
    sg-web = module.sg[0].sg-test
}


# este es solo un ejemplo para hacer un merge 

module "sg" {
    count         = 1 
    source        = "./modules/sg-module"
    vpc_id       = module.networking[0].vpc_id
    vpc_cidr_sg  = module.networking[0].vpc_cidr
    depends_on = [
      module.networking
    ]
}

data "aws_key_pair" "example" {
  key_name           = "test"
  include_public_key = true

}


module "networking" {
    count         = 1   
    source        = "./modules/networking-module"
    # some_variable = some_value
}
# module "rds" {
    
#     count         = 1    
#     source        = "./modules/rds-module"
#     list_subnet   =  tolist([module.networking[0].subnet_private-1, module.networking[0].subnet_private-2])
#     # some_variable = some_value
# }