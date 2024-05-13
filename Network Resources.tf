 # Create a VPC
resource "aws_vpc" "lungcancer-dashboard-vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    tags = {
        Name = "dashboard-production"
    }
}

# Create a Internet Gateway
resource "aws_internet_gateway" "aws-igw" {
    vpc_id = aws_vpc.lungcancer-dashboard-vpc.id
}

# Create a custom Route Table
resource "aws_route_table" "lungdashboard-route-table" {
    vpc_id = aws_vpc.lungcancer-dashboard-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aws-igw.id
    }
    tags = {
        Name = "dashboard-prod"
    }
}

# Create a subnet for the EC2
resource "aws_subnet" "dashboard-subnet-1" {
    vpc_id            = aws_vpc.lungcancer-dashboard-vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "dashboard-prod-subnet"
    }
}

# Create subnets for the RDS
resource "aws_subnet" "cloud-rds-1" {
    vpc_id            = aws_vpc.lungcancer-dashboard-vpc.id
    cidr_block        = "10.0.4.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "cloud-rds-1"
    }
}

resource "aws_subnet" "cloud-rds-2" {
    vpc_id            = aws_vpc.lungcancer-dashboard-vpc.id
    cidr_block        = "10.0.5.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "cloud-rds-2"
    }
}

resource "aws_subnet" "cloud-rds-3" {
    vpc_id            = aws_vpc.lungcancer-dashboard-vpc.id
    cidr_block        = "10.0.6.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "cloud-rds-3"
    }
}

# Create a subnet group for the RDS
resource "aws_db_subnet_group" "awsrds" {
    name       = "cloud-rds"
    subnet_ids = [aws_subnet.cloud-rds-1.id, aws_subnet.cloud-rds-3.id]
    tags = {
        Name = "resources-rds"
    }
}

# Associate the EC2 subnet with the route table
resource "aws_route_table_association" "b-route" {
    subnet_id      = aws_subnet.dashboard-subnet-1.id
    route_table_id = aws_route_table.lungdashboard-route-table.id
}
