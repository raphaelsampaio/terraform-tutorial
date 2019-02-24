provider "aws" {
  region  = "us-west-2"
  profile = "admin"
}

resource "aws_instance" "example" {
  ami           = "ami-076e276d85f524150"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
