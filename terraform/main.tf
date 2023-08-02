resource "aws_instance" "jenkins" {
  ami           = "ami-002843b0a9e09324a"
  instance_type = "t3.medium"
  key_name = "syauqi.pem"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo chkconfig docker on
              sudo yum install -y java-1.8.0
              sudo yum remove -y java-1.7.0-openjdk
              sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
              sudo yum install jenkins -y
              sudo service jenkins start
              sudo chkconfig jenkins on
              EOF

  tags = {
    Name = "Olin-Test"
  }
}