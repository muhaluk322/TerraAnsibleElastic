resource "aws_instance" "elasticsearch" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = [var.sg_id]

  tags = {
    Name = "${var.environment}-Node"
  }
}
