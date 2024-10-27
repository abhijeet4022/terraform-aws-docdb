variable "tags" {
  description = "A map of tags to assign to resources for identification and metadata."
}

variable "env" {
  description = "The environment in which the DocumentDB instance will be deployed, e.g., 'dev', 'staging', or 'production'."
}

# DocDB PG
variable "db_subnets" {
  description = "A list of subnet IDs where the DocumentDB instance will be deployed, ensuring access control and availability."
}

variable "engine_family" {
  description = "The version of the DocumentDB engine to deploy, such as '3.6' or '4.0'."
}

# DocDB SG
variable "vpc_id" {
  description = "The ID of the private VPC where the security group will be created."
}

variable "app_subnets_cidr" {
  description = "A list of CIDR blocks for application subnets allowed to access the DocumentDB instance."
}


# DocDB Cluster
variable "backup_retention_period" {
  description = "The number of days to retain backups for the DocumentDB cluster, with a minimum of 1 and a maximum of 35 days."
}

variable "preferred_backup_window" {
  description = "The preferred daily time range for automatic backups, specified in UTC (e.g., '07:00-09:00')."
}

variable "skip_final_snapshot" {
  description = "A boolean that determines whether to skip the creation of a final snapshot when the cluster is deleted. Set to 'true' to skip, or 'false' to create a final snapshot."
}

variable "engine_version" {
  description = "The version of the DocumentDB engine to use for the cluster, e.g., '3.6' or '4.0'."
}

variable "master_username" {
  description = "The username for the master user of the DocumentDB cluster."
}

variable "master_password" {
  description = "The password for the master user of the DocumentDB cluster. It must be at least 8 characters long."
}