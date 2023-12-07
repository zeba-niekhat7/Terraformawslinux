locals {
  mandatory_tags = {
    class-of-business     = var.class-of-business
    application-name      = var.application-name
    data-classification   = var.data-classification
    business-impact       = var.business-impact
    operating-environment = var.operating-environment
    security-zone         = var.security-zone
    cost-center           = var.cost-center
    support-group         = var.support-group
  }
  optional_tags = {
    backupplan = var.backupplan
  }
  host_name = var.host_name
}
