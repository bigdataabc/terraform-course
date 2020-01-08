resource "aws_security_group" "dynamic_block-example" {
  name = "dynamic_block-example"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Allow outgoing traffic to anywhere.
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
