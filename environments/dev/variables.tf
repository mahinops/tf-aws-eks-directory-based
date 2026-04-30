variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = ""
  
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
  default     = ""
}

variable "managed_by" {
  description = "The tool managing the resources"
  type        = string
  default     = ""
  
}

variable "project" {
  description = "The name of the project"
  type        = string
  default     = ""
}

variable "author" {
  description = "The author of the resources"
  type        = string
  default     = ""
}


variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}
