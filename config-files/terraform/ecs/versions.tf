terraform {
  required_version = ">= 1.7.0"
  
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.20.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
} 