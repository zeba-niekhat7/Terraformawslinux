# //////////////////////////////
# DATA
# //////////////////////////////
data "aws_availability_zones" "available" {}

data "aws_iam_instance_profile" "profile" {
  name = var.iam_instance_profile
}

data "aws_ami" "rhel8_ami" {
  #owners      = ["amazon"]
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL8-Golden-Image-*"]
  }
  #filter {
  #  name   = "platform"
  #  values = ["linux"]
  #}
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_security_group" "ssm_sg" {
  id = var.security_group
}
