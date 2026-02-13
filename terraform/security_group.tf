##
## Security Group
##

resource "aws_security_group" "private_isu" {
  name        = "private-isu-sg"
  description = "Security group for private-isu instances"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-isu-sg"
  }
}

##
## Ingress Rules
##

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.private_isu.id
  description       = "SSH"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.private_isu.id
  description       = "HTTP"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

##
## Egress Rules
##

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.private_isu.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
