# VPC
resource "aws_vpc" "tf-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "vpc-tf"
    }
}


# Public Subnet1
resource "aws_subnet" "tf-public-1" {
    vpc_id = aws_vpc.tf-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags = {
        Name = "tf-public-1"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "tf-gw" {
    vpc_id = aws_vpc.tf-vpc.id

    tags = {
        Name = "tf-gw"
    }
}

# Route Tables
resource "aws_route_table" "tf-public" {
    vpc_id = aws_vpc.tf-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf-gw.id
    }

    tags = {
        Name = "tf-public-1"
    }
}

# Route associations with public subnets
resource "aws_route_table_association" "tf-public-1-a" {
    subnet_id = aws_subnet.tf-public-1.id
    route_table_id = aws_route_table.tf-public.id
}
