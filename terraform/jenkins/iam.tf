resource "aws_iam_role" "server_iam_role" {
    name="${var.name}-iam-role"
    assume_role_policy  = jsonencode({
                Version = "2012-10-17"
              Statement = [
        {
                Action  = "sts:AssumeRole"
                Effect  = "Allow"
                Sid     = ""
                Principal = {
                Service = "ec2.amazonaws.com"
                }
        },
        ]
    
    })
  tags = {
    Name="${var.name}-iam-role"
  }
}

resource "aws_iam_policy_attachment" "server_policy_attachment" {
  count         = length(var.iam_policy) 
  name          = "${var.name}-iam-policy-attachment-${var.iam_policy[count.index]}"
  roles         = [aws_iam_role.server_iam_role.name]
  policy_arn    = "arn:aws:iam::aws:policy/${var.iam_policy[count.index]}"
}

resource "aws_iam_instance_profile" "server_instance_profile" {
  name          = "${var.name}-iam-instance-profile"
  role          = aws_iam_role.server_iam_role.name
}