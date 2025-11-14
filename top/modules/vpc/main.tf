 resource "aws_vpc" "vpc-id" {
   cidr_block = var.vpc_id
   enable_dns_hostnames = true
   enable_dns_support = true
   tags = {
     Name = "${var.environment}-vpc"
   }
 }

 resource "aws_subnet" "dynamic_subnet" {
   vpc_id = aws_vpc.vpc-id.id
   count = length(var.subnet_id)
   cidr_block = var.subnet_id[count.index]
   map_public_ip_on_launch = true
   tags = {
     Name = "${var.environment}-subnet"
   }
 }
 resource "aws_internet_gateway" "igw" {
   vpc_id = aws_vpc.vpc-id.id
 }
 resource "aws_route_table" "RT" {
   vpc_id = aws_vpc.vpc-id.id
   
 }
 resource "aws_route" "route" {
   destination_cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
   route_table_id = aws_route_table.RT.id
 }
 resource "aws_route_table_association" "ass_rt" {
    count = length(aws_subnet.dynamic_subnet)
   route_table_id = aws_route_table.RT.id
   subnet_id = aws_subnet.dynamic_subnet[count.index].id
 }