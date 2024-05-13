# Create a role for the EC2 with a policy to assume the role
resource "aws_iam_role" "ec2s3access_role" {
    name = "ec2_iam_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid    = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })
}

# Attach existing S3 full access policy to the role created for EC2
resource "aws_iam_role_policy_attachment" "AmazonS3FullAccess" {
    role       = aws_iam_role.ec2s3access_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Create an instance profile for the EC2 role
resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2-profile"
    role = aws_iam_role.ec2s3access_role.name
}