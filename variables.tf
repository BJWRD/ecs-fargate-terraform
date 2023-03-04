variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_id" {
  description = "The VPC to deploy into"
  type        = string
  default     = "vpc-bb0a42d3"
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
  default     = "igw-00bde6cffdae04a5f"
}

variable "route_table_id" {
  description = "Route Table ID"
  type        = string
  default     = "rtb-131d187b"
}

#vpc.tf - Variables

variable "subnet_ids" {
  description = "subnet IDs which resources will be launched in"
  type        = list(string)
  default     = ["subnet-4b7bd607", "subnet-34d7494e", "subnet-842072ed"]
}

variable "ecs_alb" {
  description = "ECS Application Load Balancer"
  type        = string
  default     = "Artifactory-ALB"
}

variable "alb_internal" {
  description = "Application Load Balancer Network Type"
  type        = string
  default     = "false"
}

variable "load_balancer_type" {
  description = "The type of Load Balancer"
  type        = string
  default     = "application"
}

variable "alb_listener_port" {
  description = "Application Load Balancer Listener Port"
  type        = number
  default     = 80
}

variable "alb_listener_protocol" {
  description = "Application Load Balancer Listener Protocol"
  type        = string
  default     = "HTTP"
}

variable "alb_listener_type" {
  description = "Application Load Balancer Listener Type"
  type        = string
  default     = "forward"
}

variable "alb_target_group" {
  description = "Application Load Balancer Target Group"
  type        = string
  default     = "alb-target-group"
}

variable "alb_target_group_port" {
  description = "Application Load Balancer Target Group Port"
  type        = number
  default     = 8081
}

variable "alb_target_group_protocol" {
  description = "Application Load Balancer Target Group Protocol"
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Target Type - Compatiable with awsvpc Network"
  type        = string
  default     = "ip"
}

variable "alb_target_group_path" {
  description = "Application Load Balancer Target Group Path"
  type        = string
  default     = "/"
}

variable "alb_target_group_interval" {
  description = "Application Load Balancer Target Group Interval"
  type        = number
  default     = 30
}

variable "alb_target_group_timeout" {
  description = "Application Load Balancer Target Group Timeout"
  type        = number
  default     = 10
}

variable "attachment_port" {
  description = "Application Load Balancer Target Group Attachment"
  type        = number
  default     = 8081
}

variable "alb_security_group" {
  description = "ALB Security Group Name"
  type        = string
  default     = "Artifactory-ALB-Security-Group"
}

variable "ecs_security_group" {
  description = "ECS Security Group Name"
  type        = string
  default     = "Artifactory-ECS-Security-Group"
}

variable "efs_security_group" {
  description = "EFS Security Group Name"
  type        = string
  default     = "Artifactory-EFS-Security-Group"
}

variable "cidr_block" {
  description = "CIDR Block to allow traffic via"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress_protocol" {
  description = "Egress Protocol for the Security Groups"
  type        = string
  default     = "tcp"
}

variable "egress_protocol" {
  description = "Security Group Egress Protocol"
  type        = string
  default     = "-1"
}

#ecs.tf - Variables
variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
  default     = "artifactory-cluster"
}

variable "ecs_task_family" {
  description = "ECS Task Definition Service Type"
  type        = string
  default     = "artifactory-task"
}

variable "network_mode" {
  description = "Network mode to use for the ECS container"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Fargate compatibility option"
  type        = string
  default     = "FARGATE"
}

variable "container_name" {
  description = "ECS Container Name"
  type        = string
  default     = "artifactory"
}

variable "artifactory_image" {
  description = "Artifactory Container Image"
  type        = string
  default     = "docker.bintray.io/jfrog/artifactory-oss:latest"
}

variable "essential" {
  description = "ECS Task Definition Essential Value"
  type        = bool
  default     = true
}

variable "container_cpu" {
  description = "ECS Container CPU Allocation"
  type        = number
  default     = 4096
}

variable "container_memory" {
  description = "ECS Container Memory Allocation"
  type        = number
  default     = 16384
}

variable "container_port" {
  description = "ECS Container Port"
  type        = number
  default     = 8081
}

variable "container_host_port" {
  description = "ECS Container Host Port"
  type        = number
  default     = 8081
}

variable "container_protocol" {
  description = "ECS Container Protocol"
  type        = string
  default     = "HTTP"
}

variable "container_health_check_command" {
  description = "ECS Container Health Check Command"
  type        = list(string)
  default     = ["CMD-SHELL", "curl -f http://localhost:8081 || exit 1"]
}

variable "container_health_check_interval" {
  description = "ECS Container Health Check Interval"
  type        = number
  default     = 30
}

variable "container_health_check_timeout" {
  description = "ECS Container Health Check Timeout"
  type        = number
  default     = 5
}

variable "container_health_check_retries" {
  description = "ECS Container Health Check Retries"
  type        = number
  default     = 3
}

variable "container_environment_name" {
  description = "ECS Container Environment Name"
  type        = string
  default     = "ARTIFACTORY_HOME"
}

variable "container_environment_value" {
  description = "ECS Container Environment Value"
  type        = string
  default     = "/opt/jfrog/artifactory"
}

variable "container_storage_name" {
  description = "ECS Container Storage Name"
  type        = string
  default     = "ARTIFACTORY_STORAGE"
}

variable "container_storage_value" {
  description = "ECS Container Storage Value"
  type        = string
  default     = "/opt/jfrog/artifactory/data"
}

variable "container_mount_source_volume" {
  description = "ECS Container Mount Source Volume"
  type        = string
  default     = "Artifactory"
}

variable "container_mount_path" {
  description = "ECS Container Mount Path"
  type        = string
  default     = "/opt/jfrog/artifactory/data"
}

variable "container_mount_read_only" {
  description = "ECS Container Mount Read-Only Value"
  type        = bool
  default     = false
}

variable "container_log_driver" {
  description = "ECS Container Log Driver"
  type        = string
  default     = "awslogs"
}

variable "volume_name" {
  description = "EFS Volume Name" 
  type        = string
  default     = "artifactory-volume"
}

variable "transit_encryption" {
  description = "Data Transit Encryption from ECS to EFS"
  type        = string
  default     = "ENABLED"
}

variable "efs_root_directory" {
  description = "EFS Root Directory"
  type        = string
  default     = "/opt/jfrog/artifactory"
}

variable "efs_iam_authentication" {
  description = "EFS IAM Authentication"
  type        = string
  default     = "ENABLED"
}

variable "ecs_service_name" {
  description = "Name of ECS Service"
  type        = string
  default     = "artifactory-service"
}

variable "launch_type" {
  description = "ECS Service Launch Type"
  type        = string
  default     = "FARGATE"
}

variable "desired_count" {
  description = "Create service with 1 instance to start"
  type        = number
  default     = 1
}

variable "ecs_assign_public_ip" {
  description = "ECS Assign a Public IP address value"
  type        = bool
  default     = true
}

variable "creation_token" {
  description = "EFS Creation Token"
  type        = string
  default     = "artifactory"
}

variable "efs_encryption" {
  description = "EFS Encryption"
  type        = bool
  default     = true
}

variable "transition_to_ia" {
  description = "Indicates how long it takes to transition files to the IA storage class"
  type        = string
  default     = "AFTER_30_DAYS"
}

variable "cloudwatch_log_group" {
  description = "Artifactory Cloudwatch Log Group"
  type        = string
  default     = "Artifactory-Container-Log-Group"
}

variable "cloudwatch_log_retention" {
  description = "Artifactory Cloudwatch Log Retention in days"
  type        = number
  default     = "365"
}

variable "cloudwatch_log_stream" {
  description = "Artifactory Cloudwatch Log Stream Name"
  type        = string
  default     = "Artifactory-Container-Log-Stream"
}

#iam.tf - Variables
variable "iam_role_name" {
  description = "IAM Artifactory Role Name"
  type        = string
  default     = "artifactory-ecs-instance-role"
}

variable "iam_policy_name" {
  description = "IAM Artifactory Policy Name"
  type        = string
  default     = "artifactory-ecs-access-policy"
}

variable "iam_role_ecs" {
  description = "IAM Artifactory Task Execution Role Name"
  type        = string
  default     = "artifactory-ecs-task-execution"
}

variable "iam_policy_ecs" {
  description = "IAM Artifactory ECS Task Execution Policy"
  type        = string
  default     = "Artifactory-ECS-Task-Policy"
}
