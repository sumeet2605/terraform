
resource "aws_instance" "web-server" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "rep_ser"
  subnet_id = "${var.subnetid}"
  
  vpc_security_group_ids = ["${var.sg_id}"]
  tags = {
    Name = "${var.ec2_name}"
  }
}