variable "name_cluster" {
  default = "test-backtrack"
}
variable "name_user_db" {
  default = "testg"
}

variable "passwd_user_db" {
  default = "testg123*"
}

variable "engine_db" {
  default = "mysql"
}

variable "port_db" {
  default = "3306"
}
variable "storage_db" {
    default = "20"
    
}

variable "type_db" {
    default =  "db.r5.2xlarge"
}

variable "list_subnet" {
    type =  list(string)
    default = ["",""]
}
