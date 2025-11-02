
# SG identity often constant across stacks → use vars
resource "aws_security_group" "main_sg" {
  name        = var.basic_sg_config.sg_name
  description = var.basic_sg_config.sg_description
  vpc_id      = aws_vpc.main.id
  tags        = merge(
                var.main_config.tags,
                {
                Name = var.basic_sg_config.sg_name
                }) 
}

# Ingress policy is usually same pattern → keep in vars
resource "aws_security_group_rule" "allow_inbound" {
  type              = "ingress"
  from_port         = var.basic_sg_config.ingress.from_port
  to_port           = var.basic_sg_config.ingress.to_port
  protocol          = var.basic_sg_config.ingress.protocol
  cidr_blocks       = var.basic_sg_config.ingress.cidr_blocks
  security_group_id = aws_security_group.main_sg.id
}

# Egress policy typically constant (allow all) → keep in vars (if you want global control)
resource "aws_security_group_rule" "allow_outbound" {
  type              = "egress"
  from_port         = var.basic_sg_config.egress.from_port
  to_port           = var.basic_sg_config.egress.to_port
  protocol          = var.basic_sg_config.egress.protocol
  cidr_blocks       = var.basic_sg_config.egress.cidr_blocks
  security_group_id = aws_security_group.main_sg.id
}
