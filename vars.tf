variable "tags" {}
variable "env" {}
variable "db_subnets" {
  description = "Subnets ID to create the DB"
}
variable "engine_family" {
  description = "DocumentDB Engine Version that we ant to create"
}
variable "vpc_id" {
  description = "Pass the private VPC ID To create the SG in private VPC"
}
variable "app_subnets_cidr" {
  description = "Pass the APP subnets CIDR to access the DB from App Subnets"
}