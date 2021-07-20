provider "aws" {
    profile = "terraform"
    region = "ap-south-1"
}



module "sg_module" {
    port = 22
    source = "./sg_module"
}

module "ec2_module" {
    sg_id = "${module.sg_module.sg_id}"
    source = "./ec2_module"
}

