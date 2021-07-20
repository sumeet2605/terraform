provider "aws" {
    region = "ap-south-1"
    profile = "terraform"
}

resource "aws_s3_bucket" "rizvitak" {
    bucket = "rizvitak"
    acl = "private"
    
    tags = {
        Enviroment = "Dev"
    }
}

resource "aws_s3_bucket_object" "myfirstobject" {
    bucket = "${aws_s3_bucket.rizvitak.id}"
    key = "testfile.txt"
    source = "./sampleobject.txt"
    etag = filemd5("./sampleobject.txt")
}