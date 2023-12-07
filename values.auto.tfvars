#Generic variables
command_ad_join        = true
destination_account_ids = ["522126653536"]
aws_region             = "us-east-1"
iam_instance_profile   = "mot-ec2-ssm-instance-profile-role"
golden_image_AMI_id    = "ami-0c8e5ec5b239cab47" #"ami-0256ba4f1339c6b09"
instance_type          = "t3a.medium"
subnet_id              = "subnet-0410739e57079d6f2"
ad_name                = "motiva.prv"
is_non_standard_vm     = false
non_standard_host_name = "Test-Snow-Linux-VM"
security_group        = "sg-04209b2b19946981b"
key_name               = "emmanuel-sbx-key"
patch_group            = "nonproduction-rhel8-weekly-patching"
root_volume_size       = 30
root_volume_type       = "gp3"
root_iops              = null
root_throughput        = null
enable_volume_tags     = true 
ebs_block_device       = [
    {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp3"
        device_name           = "/dev/xvdc"
    },
    {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 10
        volume_type           = "gp3"
        device_name           = "/dev/xvdd"
    }
]

# Mandatory tags
class-of-business      = "all"
application-name       = "cloud-platform-aws"
data-classification    = "na"
business-impact        = "low"
operating-environment  = "test"
security-zone          = "na"
cost-center            = "xxx1234567"
support-group          = "inf-ss-aws-support"

# Optional Tags
backupplan             = "nodailybackup"  // candidate values "daily90, daily15, nodailybackup"
host_name              = "mot-linux-snow-014"  
