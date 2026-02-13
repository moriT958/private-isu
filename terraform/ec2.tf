##
## SSH Key Pair
##

resource "tls_private_key" "ssh" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "this" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.ssh.private_key_openssh
  filename        = "${path.module}/${var.private_key_path}"
  file_permission = "0600"
}

##
## EC2 Instances
##

resource "aws_instance" "webapp" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.webapp_instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.private_isu.id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }

  tags = {
    Name = local.webapp_name
  }
}

resource "aws_instance" "bench" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.bench_instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.private_isu.id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }

  tags = {
    Name = local.bench_name
  }
}
