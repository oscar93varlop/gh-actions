data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.type_ec2
  subnet_id = var.subnet_public_ec2
  associate_public_ip_address = true
  # subnet_id = aws_subnet.sn_public.id
  vpc_security_group_ids = [var.sg-web]
  key_name = "ac_ups_terraform_202206"
  # user_data = "${file("/modules/ec2-module/userdata.sh")}"
  user_data =   <<EOF
    #!/bin/bash
    sudo yum update
    sudo yum install nc -y 
    sudo yum install telnet -y 

EOF
   tags = {
    Name = "ac_tf202206-ec2"
  }

}