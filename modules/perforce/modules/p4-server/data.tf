# Lookup of subnet that module creates
data "aws_subnet" "instance_subnet" {
  id = var.instance_subnet_id
}

# Conditionally fetch exist P4 Server AMI that unless using the auto-generated AMI
data "aws_ami" "existing_server_ami" {
  most_recent = true
  name_regex  = "p4_al2023"
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["p4_al2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = [var.instance_architecture]
  }
}
