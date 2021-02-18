module "this" {
  source = "../"
  name   = var.git
  tags   = var.tags
}

variable "git" {}

locals {
  tags = {
    git     = var.git
    creator = "terraform"
  }
}
