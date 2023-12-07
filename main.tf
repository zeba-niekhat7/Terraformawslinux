module "ec2-Instance" {
  source  = "app.terraform.io/Motiva-ServiceNow/ec2-Instance/aws"
  version = "1.0.7"
  name = "${local.host_name}"
  ami                   = var.golden_image_AMI_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [data.aws_security_group.ssm_sg.id]
  subnet_id = var.subnet_id
  associate_public_ip_address = false
  iam_instance_profile = data.aws_iam_instance_profile.profile.role_name
  enable_volume_tags = true
  volume_tags = merge({"Name": "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}-disk"}, local.mandatory_tags)
  root_block_device = [
    {
      volume_type = var.root_volume_type,
      volume_size = var.root_volume_size,
      delete_on_termination = "true",
      iops = var.root_iops,
      throughput = var.root_throughput
    }
  ]

  ebs_block_device = var.ebs_block_device

  user_data = "${file("install_proxy.sh")}"

  tags = merge({ command_ad_join  = "${var.command_ad_join}"
                 PatchGroup     = var.patch_group  
                 host_name      = "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}"
                 Name           = "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}"
                 os_platform    = "Linux"
                 backupplan     = var.backupplan  // candidate values: daily90, daily15, nodailybackup
                 ad_name = var.ad_name
               }, local.mandatory_tags, local.optional_tags)
}
