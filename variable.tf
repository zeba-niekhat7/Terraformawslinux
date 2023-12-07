# Generic Variables
variable "destination_account_ids" {type = list}
variable "command_ad_join" {type = bool}
variable "aws_region" {}
variable "host_name" {}
variable "is_non_standard_vm" {type = bool}
variable "non_standard_host_name" {}
variable "golden_image_AMI_id" {}
variable "instance_type" {}
variable "key_name" {}
# variable "vpc_id" {}
variable "subnet_id" {}
# variable "security_group" {}

variable "security_group" {}
variable "root_volume_type" {}
variable "root_volume_size" {}
variable "root_iops" {}
variable "root_throughput" {}
variable "iam_instance_profile" {}
variable "enable_volume_tags" {}
variable "ebs_block_device" {
   type    = list(map(string))
   default = []
}

# Mandatory tags
variable "class-of-business" {}
variable "application-name" {}
variable "data-classification" {}
variable "operating-environment" {}
variable "security-zone" {}
variable "cost-center" {}
variable "support-group" {}
variable "business-impact" {}

# Optional Tags
variable "ad_name" {}
variable "backupplan" {}
variable "patch_group" {}

# AWS credentials variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_session_token" {}
