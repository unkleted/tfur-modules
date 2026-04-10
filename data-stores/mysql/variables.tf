variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "identifier_prefix" {
  description = "prefix for database instance"
  type        = string
}

variable "instance_class" {
  description = "instance size of database"
  type        = string
}

variable "db_name" {
  description = "name of the database"
  type        = string
}
