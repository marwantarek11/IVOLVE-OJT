variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "vpc-1"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-00beae93a2d981137"  
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
  default     = "key-1"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instances"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0.36"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instances"
  type        = string
  default     = "db.t3.micro"
}

variable "db_identifiers" {
  description = "The identifiers for the RDS instances"
  type        = list(string)
  default     = ["mydb1", "mydb2"]
}

variable "db_username" {
  description = "The master username for the RDS instances"
  type        = string
  default     = "ivolve"
}

variable "db_password" {
  description = "The master password for the RDS instances"
  type        = string
  default     = "ivolvepass111"
}

