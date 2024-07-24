variable "availability_zone" {
  description = "Zone de disponibilité ou créer le volume EBS"
}

variable "volume_size" {
  description = "Taille du volume EBS en GB"
  default     = 10
}
