variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_key" {
  type        = string
  description = "DevOps Project 1 Public key for EC2 instance"
}

variable "ec2_ami_id" {
  type        = string
  description = "DevOps Project 1 AMI Id for EC2 instance"
}
variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
  default     = 25  # Automatically set to 25GB if not overridden
}
variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp2"  # Example default value
}