provider "aws" {
  region  = "us-west-2"
  profile = "admin"
}

resource "aws_s3_bucket" "example" {
  bucket = "raphaelsampaio-terraform-getting-started-guide"
  acl    = "private"
}

resource "aws_instance" "example" {
  ami           = "ami-076e276d85f524150"
  instance_type = "t2.micro"
  depends_on    = ["aws_s3_bucket.example"]
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
