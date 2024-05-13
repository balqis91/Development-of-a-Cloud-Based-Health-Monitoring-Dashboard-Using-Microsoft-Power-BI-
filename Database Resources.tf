# Create RDS SQL server Instance
resource "aws_db_instance" "HealthMonitoring" {
    allocated_storage     = 20
    engine                = "sqlserver-ex"
    engine_version        = "16.00.4115.5.v1"
    instance_class        = "db.t3.small"
    identifier            = "lungcancerdata"  # Corrected to lowercase
    username              = "admin"
    password              = "Ajoke91!"
    publicly_accessible   = true
    skip_final_snapshot   = true
    db_subnet_group_name  = aws_db_subnet_group.awsrds.name
    vpc_security_group_ids = [aws_security_group.permit_web.id]
}

resource "aws_db_instance_role_association" "sample" {
    db_instance_identifier = aws_db_instance.HealthMonitoring.identifier
    feature_name           = "S3_INTEGRATION"
    role_arn               = aws_iam_role.rds_role.arn
}
