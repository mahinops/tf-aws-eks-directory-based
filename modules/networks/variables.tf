variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
  default     = ""
}

variable "project" {
  description = "The project name"
  type        = string
  default     = ""
}