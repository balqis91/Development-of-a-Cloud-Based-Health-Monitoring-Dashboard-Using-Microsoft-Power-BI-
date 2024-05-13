# Create an S3 bucket
resource "aws_s3_bucket" "LungCancer_bucket" {
    bucket = "lungcancerbucket"  # The actual bucket name in AWS
    // Additional configuration
    tags = {
        Name = "LungCancerDiseaseBucket"
    }
}


# Upload an object to S3 bucket
resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.LungCancer_bucket.id
    key    = "Lung_Cancer.csv"
    source = "C:\\Users\\User\\OneDrive - Staffordshire University\\Lung_Cancer\\Lung_Cancer.csv"
    etag   = filemd5("C:\\Users\\User\\OneDrive - Staffordshire University\\Lung_Cancer\\Lung_Cancer.csv")
}






