variable "ami_id" {
  description = "Code AMI pour l'instance EC2"
}

variable "instance_type" {
  description = "Type d'intance EC2 à lancer"
}

variable "subnet_id" {
  description = "ID du sous-réseaux, auquel rattacher l'instance EC2"
}

variable "security_group_id" {
  description = "ID du groupe de sécurité auquel rattacher l'instance EC2"
  type = string
}

variable "root_volume_size" {
  description = "Taille du volume root en GB"
  default     = 5
}

#variable "ssh_key" {
#  type = string
#}
variable "devops_key_name" {
  type = string
}
