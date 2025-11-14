variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "vpc_net" {
  type = string
}
variable "ec2_subnet_id" {
  type = string
}
variable "environment" {
  type = string
}
variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}
variable "key_name" {
  type = string
}
variable "ec2_profile" {
  type = string
}