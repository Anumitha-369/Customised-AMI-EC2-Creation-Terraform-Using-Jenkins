# Security Group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"

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

# EC2 Instance from AMI [Customised AMI]
resource "aws_instance" "from_ami" {
  ami           = "ami-0875a62a2766f43c6" # your AMI ID
  instance_type = "t2.micro"
  key_name      = "terraform-keypair" # your key pair name

  vpc_security_group_ids = [
    aws_security_group.allow_ssh_http.id
  ]

  tags = {
    Name = "EC2-from-custom-AMI"
  }
}
