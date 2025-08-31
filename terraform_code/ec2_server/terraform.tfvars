# DEFINE ALL YOUR VARIABLES HERE

instance_type = "t3.medium"
ami           = "ami-0a716d3f3b16d290c"   # Ubuntu 24.04
key_name      = "key"                     # Replace with your key-name without .pem extension
volume_size   = 30
region_name   = "eu-north-1"
server_name   = "JENKINS-SERVER"

# Note: 
# a. First create a pem-key manually from the AWS console
# b. Copy it in the same directory as your terraform code
