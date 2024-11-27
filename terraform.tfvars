# AWS Region
aws_region = "ap-southeast-2"  # Sydney region

# ECR Repository Configuration
repository_name = "student-enrollment-laravel-api"
environment     = "production"
project_name    = "student-enrollment"

# Image Configuration
image_tag_mutability = "MUTABLE"
scan_on_push        = true
encryption_type     = "AES256"

# Lifecycle Policy Configuration
max_image_count     = 30

# Tags
default_tags = {
  Name        = "student-enrollment-laravel-api"
  Environment = "production"
  Project     = "student-enrollment"
  Managed_by  = "terraform"
}

# Container Configuration
# container_cpu    = 256
# container_memory = 512
container_cpu    = 1024  # 1 vCPU
container_memory = 2048  # 2GB RAM
container_port   = 80

# Cluster Configuration
cluster_name             = "laravel-node"
enable_container_insights = true

# Database Configuration
db_connection = "mysql"
db_port      = 3306
db_name      = "collage"
db_username  = "admin"
db_password  = "MLCcaringal000"