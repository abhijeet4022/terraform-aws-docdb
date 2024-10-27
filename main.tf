# Create the subnet group for documentdb
resource "aws_docdb_subnet_group" "main" {
  name       = "${local.name_prefix}-subnet-group"
  subnet_ids = var.db_subnets
  tags       = merge(local.tags, { Name = "${local.name_prefix}-subnet-group" })
}


# Create the Parameter Group.
resource "aws_docdb_cluster_parameter_group" "main" {
  family      = var.engine_family
  name        = "${local.name_prefix}-pg"
  description = "${local.name_prefix}-pg"
  tags        = merge(local.tags, { Name = "${local.name_prefix}-pg" })
}


# SG for DocumentDB.
resource "aws_security_group" "docdb_sg" {
  name        = "${local.name_prefix}-sg"
  description = "${local.name_prefix}-sg"
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, { Name = "${local.name_prefix}-sg" })
}


# Ingress rule for DocDB SG.
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  for_each          = toset(var.app_subnets_cidr) # Convert list to a set to iterate over each CIDR
  security_group_id = aws_security_group.docdb_sg.id
  cidr_ipv4         = each.value # Each CIDR block as a separate rule
  from_port         = 27017
  to_port           = 27017
  ip_protocol       = "tcp"
}


# Egress rule for DocDB SG.
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.docdb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# DocumentDB Database Cluster
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier              = "${local.name_prefix}-cluster"
  engine                          = "docdb"
  engine_version                  = var.engine_version
  db_subnet_group_name            = aws_docdb_subnet_group.main.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.main.name
  vpc_security_group_ids          = [aws_security_group.docdb_sg.id]
  master_username                 = var.master_username
  master_password                 = var.master_password
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  skip_final_snapshot             = var.skip_final_snapshot
  tags                            = merge(local.tags, { Name = "${local.name_prefix}-cluster" })
}
