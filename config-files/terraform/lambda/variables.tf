variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Lambda will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the Lambda will be deployed"
  type        = list(string)
} 