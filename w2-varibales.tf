variable "aws_region" {
    description = "resource going to be created"
    type = string
    default = "us-east-1"
} 

variable "aws_ami" {
    description = "aim id from sources"
    type = string
    default = "data.aws_ami.ubuntu.id"
  
}

variable "aws_keypair" {
    description = "to login to the server"
    type = string
    default = "terraform"
  
}

variable "instancetype" {
    description = "intance type which will be created"
    type = string
    default = "t2.medium"
}