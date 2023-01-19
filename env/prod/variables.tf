##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "shira-test"
    env     = "prod"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

##Network
variable "vpc" {
  description = "CIDR BLOCK for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type = map(any)
  default = {
    availability_zones = {
      az-1a = {
        az = "ap-northeast-1a"
      },
      az-1c = {
        az = "ap-northeast-1c"
      }
    }
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    subnets = {
      public-1a = {
        name = "public-1a",
        cidr = "10.0.10.0/24",
        az   = "ap-northeast-1a"
      },
      public-1c = {
        name = "public-1c",
        cidr = "10.0.30.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "dmz_subnets" {
  type = map(any)
  default = {
    subnets = {
      dmz-1a = {
        name = "dmz-1a",
        cidr = "10.0.20.0/24",
        az   = "ap-northeast-1a"
      },
      dmz-1c = {
        name = "dmz-1c",
        cidr = "10.0.40.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "10.0.50.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "10.0.70.0/24"
        az   = "ap-northeast-1c"
      }
    }
  }
}

##EC2
variable "ami" {
  description = "ID of AMI to use for ec2 instance"
  default     = "ami-0bba69335379e17f8"
}

variable "instance_type_web" {
  description = "The type of instance"
  type        = string
  default     = "t3.micro"
}

variable "volume_type_web" {
  description = "The type of root block device"
  type        = string
  default     = "gp2"
}

variable "volume_size_web" {
  description = "The size of root block device"
  default     = 100
}

variable "key_name_web" {
  description = "key name of the key pair"
  type        = string
}

variable "public_key_path_web" {
  description = "key path of the web instance's public key. Example: ~/.ssh/terraform.pub"
  type        = string
}

##Bastion
variable "instance_type_bastion" {
  description = "The type of bastion instance"
  type        = string
  default     = "m4.large"
}

variable "volume_type_bastion" {
  description = "The type of root block device"
  type        = string
  default     = "gp2"
}

variable "volume_size_bastion" {
  description = "The size of root block device"
  default     = 100
}

variable "key_name_bastion" {
  description = "key name of the key pair"
  type        = string
}

variable "public_key_path_bastion" {
  description = "key path of the bastion's public key. Example: ~/.ssh/terraform.pub"
  type        = string
}

##Route53 Zone 
#variable "zone_name" {
#  description = "zone name of route53"
#  type        = string
#  default     = "shiratest.net"
#}

##Route53 Records
variable "sub_domain_1" {
  description = "name of sub domain"
  type        = string
  default     = "www"
}

##Docker Image Name
variable "image_name" {
  description = "docker image name"
  type = "string"
  default = ""
}