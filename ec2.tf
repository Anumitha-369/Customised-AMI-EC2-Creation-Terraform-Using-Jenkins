# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Security Group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow-ssh-http-terraform"
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

# EC2 Instance from Custom AMI
resource "aws_instance" "from_ami" {
  ami           = "ami-02f398689276ace9b"   # Your custom AMI
  instance_type = "t2.micro"
  key_name      = "terraform-keypair"

  vpc_security_group_ids = [
    aws_security_group.allow_ssh_http.id
  ]

  tags = {
    Name = "EC2-from-custom-AMI"
  }
}
