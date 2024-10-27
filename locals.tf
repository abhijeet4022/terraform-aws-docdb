locals {
  tags        = merge(var.tags, { module-name = "docdb" }, { env = var.env })
  name_prefix = "${var.env}-docdb"
}



