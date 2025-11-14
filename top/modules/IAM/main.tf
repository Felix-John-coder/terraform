#creating role 
resource "aws_iam_role" "this" {
  name =  "${var.environment}-${var.role_name}"
  assume_role_policy = var.assume_role

  tags = {
    Name = "${var.role_name}-${var.environment}-role"
  }
}

#create policy 
resource "aws_iam_policy" "this_policy" {
  name = "${var.environment}-${var.policy_name}"
  description = var.description
  policy = var.policy_json
  tags = {
    Name = "${var.policy_name}-${var.environment}-policy"
  }
}

#attach the role and policy 
resource "aws_iam_role_policy_attachment" "attach" {
  role = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this_policy.arn
}

#connect to an ec2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance_profile"
  role = aws_iam_role.this.name
}