# Assign an Elastic IP to the network interface created previously
resource "aws_eip" "one" {
    domain              = "vpc"  # Replaces vpc = true
    network_interface   = aws_network_interface.web-server-ni.id
    associate_with_private_ip = "10.0.1.50"
    depends_on          = [aws_internet_gateway.aws-igw]
}
