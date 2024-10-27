variable "tags" {
  description = "A map of tags to assign to resources for identification and metadata."
}

variable "env" {
  description = "The environment in which the DocumentDB instance will be deployed, e.g., 'dev', 'staging', or 'production'."
}

variable "db_subnets" {
  description = "A list of subnet IDs where the DocumentDB instance will be deployed, ensuring access control and availability."
}

variable "engine_family" {
  description = "The version of the DocumentDB engine to deploy, such as '3.6' or '4.0'."
}

variable "vpc_id" {
  description = "The ID of the private VPC where the security group will be created."
}

variable "app_subnets_cidr" {
  description = "A list of CIDR blocks for application subnets allowed to access the DocumentDB instance."
}
