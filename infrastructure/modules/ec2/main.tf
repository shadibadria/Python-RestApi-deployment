variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}
variable "root_volume_type" {}
variable "root_volume_size" {}

output "ssh_connection_string_for_ec2" {
  value = format("%s%s%s", "ssh -i ../.keys/ ",var.tag_name, aws_instance.ec2_instance_ip.public_ip)
}

output "ec2_instance_ip" {
  value = aws_instance.ec2_instance_ip.id
}

output "dev_proj_1_ec2_instance_public_ip" {
  value = aws_instance.ec2_instance_ip.public_ip
}

resource "aws_instance" "ec2_instance_ip" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  key_name                    = var.tag_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address

  user_data = var.user_data_install_jenkins

  metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
    # Root Volume with 25GB GP2
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    delete_on_termination = true
  }
}

resource "aws_key_pair" "ec2_instance_public_key" {
  key_name   = var.tag_name
  public_key = var.public_key
}

