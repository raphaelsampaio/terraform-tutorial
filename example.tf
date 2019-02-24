provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

# outputs a resource attribute, specified using resource_type.name.attribute
# this output variable will be named "ip"
output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
