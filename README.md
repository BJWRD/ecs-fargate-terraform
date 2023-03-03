# ecs-fargate-terraform
An ECS/Fargate solution which runs a Serverless Container, while it's logs are transferred across to an S3 bucket via Cloudwatch and Kinesis - provisioned via Terraform.

# Architecture
Enter Image

# Prerequisites
* An AWS Account with an IAM user capable of creating resources – `AdminstratorAccess`
* A locally configured AWS profile for the above IAM user
* Terraform installation - [steps](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* AWS EC2 key pair - [steps](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
* Environment Variables for AWS CLI - [steps](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
* tfupdate installation - [steps](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)
* tfsec installation - [steps](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)

# How to Apply/Destroy
This section details the deployment and teardown of the three-tier-architecture. **Warning: this will create AWS resources that costs money**

## Deployment Steps

#### 1.	Clone the repo
    git clone https://github.com/BJWRD/ecs-fargate-terraform && cd ecs-fargate-terraform
    
#### 2. Update the s3 bucket name to your own - `versions.tf`

    backend "s3" {
      bucket = "ENTER HERE"
      key    = "terraform.tfstate"
      region = "eu-west-2"
    }
    

#### 3. Update `versions.tf`
    tfupdate terraform versions.tf && tfupdate provider aws versions.tf
    
#### 4.	Initialise the TF directory
    terraform init

#### 5. Ensure the terraform code is formatted and validated 
    terraform fmt && terraform validate

#### 6. `tfsec` - vulnerability check
    tfsec
    
#### 7. Create an execution plan
    terraform plan

#### 8. Execute terraform configuration 
    terraform apply --auto-approve
    
Enter Image


## Verification Steps 

#### 1. Check AWS Infrastructure
Check the infrastructure deployment status, by enter the following terraform command -

     terraform show

Enter Image

**NOTE:** You may want to ouput `terraform show` to a .txt file for easier viewing i.e. terraform show > tf_infrastructure.txt

Alternatively, log into the AWS Console and verify your AWS infrastructure deployment from there.

#### VPC Verification

Enter Image

#### ECS Verification

Enter Image

#### S3 Bucket Verification

Enter Image

#### Cloudwatch Verification

Enter Image

#### Kinesis Verification

Enter Image

#### 2. Verify that the container is accessible

Update
    
Enter Image

## Teardown Steps

####  1. Destroy the deployed AWS Infrastructure 
`terraform destroy --auto-approve`

Enter Image

## Requirements
| Name          | Version       |
| ------------- |:-------------:|
| terraform     | ~>1.3.9       |
| aws           | ~>3.50.0      |

## Providers
| Name          | Version       |
| ------------- |:-------------:|
| aws           | ~>3.50.0      |


## Resources
| Name          | Type       |
| ------------- |:-------------:|
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_vpc) | resource |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_subnet) | resource |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_internet_gateway) | resource |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_route_table) | resource |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_route_table_association) | resource |
| [aws_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb) | resource |
| [aws_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb_listener) | resource |
| [aws_lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb_target_group) | resource |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_security_group) | resource |
