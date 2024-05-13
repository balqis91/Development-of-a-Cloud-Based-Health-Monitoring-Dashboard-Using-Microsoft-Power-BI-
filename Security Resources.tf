# Create security group to allow specific ports and ICMP
resource "aws_security_group" "permit_web" {
    name        = "permit_web_traffic"
    description = "Permit web inbound traffic"
    vpc_id      = aws_vpc.lungcancer-dashboard-vpc.id

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTPS"
    }

ingress {
        from_port   = 1443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "MSSQL"
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP"
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH"
    }

    ingress {
        from_port   = 3389
        to_port     = 3389
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "RDP"
    }

    ingress {
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        description = "Permit all incoming ICMP - IPv4 traffic"
        cidr_blocks = ["0.0.0.0/0"]
          }
 egress {
        from_port = 0
        to_port = 0
        protocol = "-1"  # Allowing all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "permit_web"
    }
}

# Create a network interface with an IP in the subnet that was created in step 4
resource "aws_network_interface" "web-server-ni" {
    subnet_id        = aws_subnet.dashboard-subnet-1.id
    private_ips      = ["10.0.1.50"]
    security_groups  = [aws_security_group.permit_web.id]
}