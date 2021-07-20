module shared_vars {
    source = "../shared_variables"
}

resource "aws_security_group" "terraform_ec2_sg" {
    name = "sg_name_${module.shared_vars.env_suffix}"
    description = "terraform security group"
    vpc_id = "${var.vpcid}"

    ingress {
        from_port = "${var.port}"
        to_port = "${var.port}"
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

output "sg_id" {
    value = "${aws_security_group.terraform_ec2_sg.id}"
}
