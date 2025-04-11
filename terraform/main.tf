module "jenkins" {
  source        = "./jenkins"
  for_each      = var.server
  name          = each.key 
  instance_type = each.value["instance_type"]
  disk_size     = each.value["root_disk"] 
  aws_ami_id    = var.aws_ami_id 
  vpc_id        = var.vpc_id 
  port          = each.value["port"] 
  subnet_id     = var.subnet_id 
  iam_policy    = each.value["policy_name"] 
}