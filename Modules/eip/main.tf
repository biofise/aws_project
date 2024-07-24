resource "aws_eip_association" "eip_assoc" {
  count = 0

  instance_id   = var.aws_instance_id
  allocation_id = var.eip_allocation_id
}
