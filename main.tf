resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my-vpc"
    }
  
}


resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "mysubnet1"
    }
  
}
