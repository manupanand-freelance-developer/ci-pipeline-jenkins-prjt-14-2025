resource "aws_instance" "server" {
    depends_on = [ aws_security_group.server ]
    ami                     = var.aws_ami_id
    instance_type           = var.instance_type
    subnet_id               = var.subnet_id
    vpc_security_group_ids  = [ aws_security_group.server_security_group.id ]
    iam_instance_profile    = aws_iam_instance_profile.server_instance_profile.id


    root_block_device {
      delete_on_termination = true
      volume_size           = var.disk_size
    }
    instance_market_options {
      market_type = "spot"
      spot_options {
        instance_interruption_behavior  = "stop"
        spot_instance_type              = "persistent" 
      }
    }
    # user_data = 

  tags = {
    Name="${var.name}-server"
  }
}