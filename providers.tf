Example 1: Configuring AWS as a Provider:

# providers.tf

# Define the required provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # specify the version
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-west-2" # set your AWS region
  # You can use other authentication methods like AWS CLI, environment variables, etc.
}

Example 2: Using Multiple Providers:

# providers.tf

# Specify required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# Configure AWS provider
provider "aws" {
  region = "us-west-2"
}

# Configure Google Cloud provider
provider "google" {
  project = "your-google-project-id"
  region  = "us-central1"
}

Example 3: Using Aliased Providers:

# providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Primary AWS provider
provider "aws" {
  region = "us-east-1"
}

# Secondary AWS provider with alias
provider "aws" {
  alias  = "us_west"
  region = "us-west-2"
}

Example 1: Creating an AWS EC2 Instance
To create an EC2 instance on AWS, you would write the following in resources.tf:

# resources.tf

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # AMI ID for your region
  instance_type = "t2.micro"               # Instance type

  tags = {
    Name = "ExampleInstance"
  }
}


In this example:
aws_instance is the resource type for an EC2 instance.
example is the name you give to this resource within Terraform.
ami and instance_type are properties for the instance.
Example 2: Creating an S3 Bucket in AWS
To create an S3 bucket, you can add the following:

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"  # Access control

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

In this example:
aws_s3_bucket is the resource type for an S3 bucket.
my_bucket is the resource name, used to refer to this bucket in other configurations.
bucket sets the bucket’s name, and acl sets the access control.
