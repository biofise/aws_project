resource "aws_instance" "mariadb_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id] 
  key_name        = var.devops_key_name  

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
  }

  associate_public_ip_address = true
  tags = {
    Name = "Bastion Host"
  }
}
