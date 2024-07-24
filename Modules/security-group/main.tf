resource "aws_security_group" "mariadb_sg" {
  name        = "mariadb-sg"
  description = "GS pour les instances MariaDB"
  vpc_id      = var.network_vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet_cidr]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Groupe de securite MariaDB"
  }
}
