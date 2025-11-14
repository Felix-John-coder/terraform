resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  iam_instance_profile = var.ec2_profile
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = var.ec2_subnet_id

  tags = {
    Name = "${var.environment}-ec2"
  }
}
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_net
   
   ingress {
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.cidr]
   }
    ingress {
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.cidr]
   }
    ingress {
    description = "allow https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.cidr]
   }
   egress {
    description = "allow outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.cidr]
   }
   tags = {
     Name = "${var.environment}-SG"
   }
}