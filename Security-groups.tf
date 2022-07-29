# security group for jenkins server

resource "aws_security_group" "vprofile-jenkins-sg" {
  name        = "vprofile-jenkins-sg"
  description = "Security group for Jenkins"
   dynamic "ingress" {
    for_each = var.jenkins-port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.my_IP]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "sonarcube-to-jenkins" {  

  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = "${aws_security_group.vprofile-jenkins-sg.id}"
  source_security_group_id = "${aws_security_group.vprofile-sonar-sg.id}"

  
  
}


# security group for nexus server

resource "aws_security_group" "vprofile-nexus-sg" {
  name        = "vprofile-nexus-sg"
  description = "Security group for Nexus server"

  dynamic "ingress" {
    for_each = var.nexus-port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.my_IP]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "jenkins-to-nexus" {  

  type = "ingress"
  from_port = 8081
  to_port = 8081
  protocol = "tcp"
  security_group_id = "${aws_security_group.vprofile-nexus-sg.id}"
  source_security_group_id = "${aws_security_group.vprofile-jenkins-sg.id}"
  
}

# security group for sonarcube server

resource "aws_security_group" "vprofile-sonar-sg" {
  name        = "vprofile-sonar-sg"
  description = "Security group for sonar server"

  dynamic "ingress" {
    for_each = var.sonar-port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.my_IP]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "jenkins-to-sonar" {  

  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = "${aws_security_group.vprofile-sonar-sg.id}"
  source_security_group_id = "${aws_security_group.vprofile-jenkins-sg.id}"
}