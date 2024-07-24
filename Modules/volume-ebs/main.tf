resource "aws_ebs_volume" "mongodb_volume" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = "gp2"

  tags = {
    Name = "MongoDB Volume"
  }
}
