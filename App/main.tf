data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"]
}

module "network" {
  source              = "../Modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "link_eip_to_ec2" {
 source = "../Modules/eip"
 aws_instance_id = module.ec2-instance.ec2_instance_id
 eip_allocation_id = module.network.eip_allocation_id 

}

module "ecs-cluster" {
  source = "../Modules/ecs-cluster"
}

module "security-group" {
  source              = "../Modules/security-group"
  network_vpc_id      = module.network.vpc_id
  public_subnet_cidr  = module.network.public_subnet_cidr
  private_subnet_cidr = module.network.private_subnet_cidr
}

module "volume-ebs" {
  source = "../Modules/volume-ebs"
  availability_zone = module.network.public_subnet_availability_zone
  volume_size       = 20
}

module "ec2-instance" {
  source            = "../Modules/ec2-instance"
  ami_id            = data.aws_ami.ubuntu.id  
  instance_type     = "t2.micro"
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security-group.security_group_id
  root_volume_size  = 20
  devops_key_name   = "devops-access"
}

module "efs" {
  source            = "../Modules/efs"
  subnet_ids        = { "subnet1" = module.network.public_subnet_id, "subnet2" = module.network.private_subnet_id }
  security_group_id = module.security-group.security_group_id
}

module "ecs-services" {
  source = "../Modules/ecs-services"
  efs_file_system_id   = module.efs.efs_id
  ecs_cluster_id       = module.ecs-cluster.ecs_cluster_id
  private_subnet_id    = module.network.private_subnet_id
  security_group_id    = module.security-group.security_group_id
}
