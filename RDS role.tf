# Create a role for the RDS to interact with other AWS services
resource "aws_iam_role" "rds_role" {
    name = "rds_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid    = ""
                Principal = {
                    Service = "rds.amazonaws.com"
                }
            },
        ]
    })
}

# Attach the S3 full access policy to the RDS role for enabling S3 integration features
resource "aws_iam_role_policy_attachment" "rds_s3_full_access" {
    role       = aws_iam_role.rds_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Create an instance profile for the RDS role
resource "aws_iam_instance_profile" "rds_profile" {
    name = "rds-profile"
    role = aws_iam_role.rds_role.name
}
