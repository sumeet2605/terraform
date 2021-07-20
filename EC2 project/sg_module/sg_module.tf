
resource "aws_security_group" "terraform_ec2_sg" {
    name = "${var.sg_name}"
    description = "terraform security group"
    vpc_id = "${var.vpcid}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "sg_id_output" {
    value = "${aws_security_group.terraform_ec2_sg.id}"
}
