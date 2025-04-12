resource "aws_route53_record" "public_dns" {
  depends_on    = [ aws_instance.server ]
  zone_id       = var.dns_zone_id
  name          = "${var.name}.${var.dns_name}"
  type          = "A"
  ttl           = 15
  records       = [aws_instance.server.public_ip]
}
resource "aws_route53_record" "private_dns" {
  depends_on = [ aws_instance.server ]
  zone_id    = var.dns_zone_id
  name       = "${var.name}.${var.dns_name}"
  type       = "A"
  ttl        = 15
  records    = [aws_instance.server.private_ip]
}