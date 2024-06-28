Here's a detailed README.md file that includes instructions on setting up and deploying the infrastructure, including prerequisites, steps to run Terraform commands, and verification steps.

md
# Deploy a Static Website on AWS using Terraform

## Objective

Create an AWS infrastructure to host a static website using Terraform. The infrastructure will include:
- **AWS S3** for storing the website files
- **CloudFront** for content delivery
- **Route 53** for domain name management
- **API Gateway** for managing APIs
- **IAM** roles and policies for permissions
- **SSL certificates** for HTTPS

## Prerequisites

- AWS Account
- Domain name registered in Route 53
- Terraform installed on your local machine

## File Structure


terraform-static-website
├── modules
│   ├── s3
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── cloudfront
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── route53
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── iam
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── apigateway
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
├── api_gateway_config.tf
├── api_gateway_resources.tf
├── certificate.tf
├── data.tf
├── init.tf
├── main.tf
├── outputs.tf
├── permissions.tf
├── README.md
├── route53.tf
├── variables.tf
└── s3-static-website.png


## Files Description


- `certificate.tf`: SSL certificate configuration.
- `init.tf`: Initialization configuration for Terraform.
- `main.tf`: Main infrastructure setup.
- `outputs.tf`: Outputs for Terraform.
- `permissions.tf`: IAM roles and policies.
- `README.md`: Project documentation.
- `route53.tf`: Route 53 DNS configuration.
- `variables.tf`: Variables used in the Terraform project.
- `s3-static-website.png`: Diagram of the infrastructure.

## Setup and Deployment Instructions

### Step 1: Clone the Repository

Clone this repository to your local machine:

bash
git clone https://github.com/yourusername/terraform-static-website.git
cd terraform-static-website


### Step 2: Configure Terraform

1. **Initialize Terraform:**
   bash
   terraform init
   

2. **Create `terraform.tfvars` file:**

   Create a `terraform.tfvars` file in the root directory to specify the required variables. Example content:

   hcl
   aws_region    = "us-west-2"
   domain_name   = "example.com"
   certificate_arn = "arn:aws:acm:us-west-2:123456789012:certificate/abcd-1234-efgh-5678"
   bucket_name   = "my-static-website-bucket"
   

3. **Validate the configuration:**
   bash
   terraform validate
   

### Step 3: Apply the Configuration

Run the following command to create the infrastructure:

bash
terraform apply


Terraform will display a plan of the changes it will make. Type `yes` to approve and apply the changes.

### Step 4: Verify the Deployment

1. **S3 Bucket:**
   - Go to the AWS S3 console and check that the bucket has been created and configured as a website.

2. **CloudFront Distribution:**
   - Verify that the CloudFront distribution is deployed. Go to the CloudFront console and check the status and settings.

3. **Route 53:**
   - Ensure the DNS settings are correctly configured. Check the Route 53 console for the domain and the records.

4. **API Gateway:**
   - Confirm the API Gateway is set up correctly. Check the API Gateway console for the configured resources.

### Step 5: Clean Up

To destroy the infrastructure when you no longer need it, run:

bash
terraform destroy


## Notes

- Ensure you have the necessary IAM permissions to create the resources in AWS.
- The S3 bucket name must be globally unique.
- Update the `terraform.tfvars` file with your specific details.

## Diagram

![Infrastructure Diagram](s3-static-website.png)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


This README.md file provides a clear and comprehensive guide for setting up and deploying the infrastructure, including prerequisites, detailed instructions for running Terraform commands, and verification steps.