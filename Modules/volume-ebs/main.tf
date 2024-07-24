resource "aws_ebs_volume" "mariadb_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = "gp2"

  tags = {
    Name = "MariaDB Volume"
  }
}
