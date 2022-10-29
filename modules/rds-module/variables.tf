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
    default =  "db.t2.micro"
}

variable "list_subnet" {
    type =  list(string)
    default = ["",""]
}
