provider "aws" {
    profile = "terraform"
    region = "ap-south-1"
}

module "sg_module" {
    sg_name = "sg_ec2_${local.env}"
    source = "./sg_module"

}

module "ec2_module" {
    sg_id = "{module.sg_module.sg_id_output}"
    ec2_name = "Rizvitak_Web_Server_${local.env}"
    source = "./ec2_module"
}

locals {
    env = "$terraform.workspace"
}