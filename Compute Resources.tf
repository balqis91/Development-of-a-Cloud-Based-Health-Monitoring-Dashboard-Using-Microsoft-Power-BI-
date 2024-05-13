# Create EC2 Windows server and install necessary software and download file from S3 bucket
resource "aws_instance" "clouddashboard-server" {
    ami                    = "ami-0f496107db66676ff" //"ami-0bde1eb2c18cb2abe"
    instance_type          = "t2.medium"
    availability_zone      = "us-east-1a"
    key_name               = "Lungs cancer EC2 Keypair"
    iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
    network_interface {
        device_index      = 0
        network_interface_id = aws_network_interface.web-server-ni.id
    }
    user_data = <<-EOF
        <powershell>
        Invoke-WebRequest -Uri "https://awscli.amazonaws.com/AWSCLIV2.msi" -Outfile "C:\\AWSCLIV2.msi"
        $arguments = "/i `\"C:\\AWSCLIV2.msi`\" /quiet"
        Start-Process "msiexec.exe" -ArgumentList $arguments -Wait
        # Ensure the AWS CLI is added to the path
        [System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\\Program Files\\Amazon\\AWSCLIV2\\", [System.EnvironmentVariableTarget]::Machine)
        aws s3 cp "s3://LungCancerBucket/Lung Cancer.csv" "C:\\Users\\Administrator\\Downloads\\Lung Cancer.csv"
        Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF5454B0/PBIDesktopSetup_x64.exe" -Outfile "C:\\PBIDesktopSetup_x64.exe"
        Start-Process -FilePath "C:\\PBIDesktopSetup_x64.exe" -ArgumentList '-silent', '-norestart', 'ACCEPT_EULA=1' -Wait
        Invoke-WebRequest -Uri "https://aka.ms/ssmsfullsetup" -Outfile "C:\\SSMS-Setup-ENU.exe"
        Start-Process -FilePath "C:\\SSMS-Setup-ENU.exe" -ArgumentList "/Install /Quiet" -Wait
        </powershell>
    EOF
    tags = {
        Name = "Dashboard-web-server"
    }
}
