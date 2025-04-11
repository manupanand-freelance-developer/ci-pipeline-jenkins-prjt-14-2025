resource "aws_security_group" "server_security_group" {
    name        = "${var.name}-security-group"
    description = "allow ports for jenkins server"
    vpc_id      = var.vpc_id

    egress {
        from_port   =  0
        to_port     =  0
        protocol    =  "-1"
        cidr_blocks =  ["0.0.0.0/0"]
    }
    dynamic "ingress" {
        for_each = var.port
      content {
        from_port   = tonumber(ingress.value)
        to_port     = tonumber(ingress.value)
        protocol    = "TCP"
        cidr_blocks =["0.0.0.0/0"] 
        
      }
    }
    tags = {
      Name="${var.name}-security-group"
    }
  
}