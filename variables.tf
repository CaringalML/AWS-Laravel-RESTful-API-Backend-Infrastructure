variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., production, staging, development)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "The encryption type to use for the repository"
  type        = string
  default     = "AES256"
}

variable "max_image_count" {
  description = "Maximum number of images to keep in the repository"
  type        = number
  default     = 30
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
}

variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
}

variable "container_cpu" {
  description = "CPU units for the container (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "Memory for the container in MiB"
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 80
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "laravel-node"
}

variable "enable_container_insights" {
  description = "Enable CloudWatch Container Insights for the cluster"
  type        = bool
  default     = true
}

# Database Variables
variable "db_connection" {
  description = "Database connection type"
  type        = string
  default     = "mysql"
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 3306
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}