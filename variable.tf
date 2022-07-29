variable "my_IP" {
  default = "20.213.130.94/32"
}

variable "jenkins-port" {
  type = list(any)
  default = [8080,22]
}

variable "nexus-port" {
  type = list(any)
  default = [ 22,8081 ]
  
}

variable "sonar-port" {
  type = list(any)
  default = [80]
  
}

variable "instance_type" {
  type= list(any)
  default = [ "t2.small","t2.medium" ]
}