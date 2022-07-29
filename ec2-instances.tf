# ec2 instance for jenkins server 
resource "aws_instance" "jenkins-server" {
  ami                    = "ami-08841b3495d14efb1"
  instance_type          = var.instance_type[0]
  vpc_security_group_ids = [aws_security_group.vprofile-jenkins-sg.id]
  key_name               = "tomcat-key"
  user_data = "${file("jenkins-setup.sh")}"
  tags = {
    Name = "jenkins-server"

  }

}

output "jenkin-server-ip" {
  value = aws_instance.jenkins-server.public_ip

}

#ec2 instance for nexus server

resource "aws_instance" "nexus-server" {
  ami                    = "ami-02358d9f5245918a3"
  instance_type          = var.instance_type[1]
  vpc_security_group_ids = [aws_security_group.vprofile-nexus-sg.id]
  key_name               = "tomcat-key"
  user_data = "${file("nexus-setup.sh")}"
  tags = {
    Name = "nexus-server"

  }

}

output "nexus-server-ip" {
  value = aws_instance.nexus-server.public_ip

}

#ec2 instance for sonarcube server

resource "aws_instance" "sonarcube-server" {
  ami                    = "ami-08841b3495d14efb1"
  instance_type          = var.instance_type[1]
  vpc_security_group_ids = [aws_security_group.vprofile-sonar-sg.id]
  key_name               = "tomcat-key"
  user_data = "${file("sonar-setup.sh")}"
  tags = {
    Name = "sonarcube-server"

  }

}

output "sonarcube-server-ip" {
  value = aws_instance.nexus-server.public_ip

}
