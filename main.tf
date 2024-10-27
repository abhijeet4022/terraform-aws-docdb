# Create the subnet group for documentdb
resource "aws_docdb_subnet_group" "main" {
  name       = "${local.name_prefix}-sg"
  subnet_ids = var.db_subnets
  tags       = merge(local.tags, { Name = "${local.name_prefix}-sg" })
}


# Create the Parameter Group.
resource "aws_docdb_cluster_parameter_group" "main" {
  family      = var.engine_family
  name        = "${local.name_prefix}-pg"
  description = "${local.name_prefix}-pg"
  tags        = merge(local.tags, { Name = "${local.name_prefix}-pg" })

}


