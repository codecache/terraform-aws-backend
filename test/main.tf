module "this" {
  source = "../"
  name   = var.git
  tags   = local.tags
}

variable "git" {}

locals {
  tags = {
    git     = var.git
    creator = "terraform"
  }
}
