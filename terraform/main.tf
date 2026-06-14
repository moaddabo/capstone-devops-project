provider "aws" {
  region = "us-east-1"
}

variable "image_name" {
  type = string
}

resource "aws_security_group" "app_sg" {
  name        = "capstone-app-sg"
  description = "Allow app traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = "capstone-key"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              systemctl enable docker
              docker run -d -p 8080:8080 ${var.image_name}
              EOF

  tags = {
    Name = "capstone-app-server"
  }
}

output "app_url" {
  value = "http://${aws_instance.app.public_ip}:8080"
}
