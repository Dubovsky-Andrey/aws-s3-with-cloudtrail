# AWS S3 with CloudTrail

A Terraform project that provisions an AWS S3 bucket with CloudTrail integration. The S3 bucket is configured with optional encryption, versioning, and lifecycle policies for log retention. CloudTrail is set up to log events to the S3 bucket.

## Features

- Creates an S3 bucket with:
  - Configurable versioning
  - Optional server-side encryption
  - Lifecycle rules for log retention
  - IAM policy for CloudTrail integration
- Provisions an AWS CloudTrail with:
  - Multi-region support
  - Global service event logging
  - Log file integrity validation
- Tags resources with project and environment variables.

## Requirements

- Terraform >= 1.11.3
- AWS Provider >= 5.94.1
- AWS Account with appropriate permissions

## Usage

1. **Clone the Repository**  
   Clone this repository to your local machine.

   ```bash
   git clone <repository-url>
   cd aws-s3-with-cloudtrail
   ```

2. **Configure Variables**  
   Update the `terraform.tfvars` file with your desired values. Below are the required variables:

   | Name                          | Description                                     | Type   | Example Value                     | Required |
   | ----------------------------- | ----------------------------------------------- | ------ | --------------------------------- | -------- |
   | aws_region                    | The AWS region for the resources                | string | `us-east-1`                       | yes      |
   | project_name                  | The name of the project                         | string | `aws-s3-with-cloudtrail`          | yes      |
   | environment                   | The environment name                            | string | `dev`                             | yes      |
   | cloudtrail_bucket             | The name of the S3 bucket for CloudTrail logs   | string | `my-unique-bucket-name-2025-1111` | yes      |
   | versioning_enabled            | Enable versioning for the S3 bucket             | bool   | `true`                            | yes      |
   | enable_encryption             | Enable server-side encryption for the S3 bucket | bool   | `true`                            | yes      |
   | encryption_algorithm          | Encryption algorithm for the S3 bucket          | string | `AES256`                          | yes      |
   | log_retention_days            | Number of days to retain logs in the S3 bucket  | number | `90`                              | yes      |
   | cloudtrail_name               | The name of the CloudTrail                      | string | `aws-s3-with-cloudtrail`          | yes      |
   | is_multi_region_trail         | Enable multi-region trail for CloudTrail        | bool   | `true`                            | yes      |
   | include_global_service_events | Log global service events in CloudTrail         | bool   | `true`                            | yes      |
   | enable_log_file_validation    | Enable log file validation in CloudTrail        | bool   | `true`                            | yes      |
   | enable_logging                | Enable logging for CloudTrail                   | bool   | `true`                            | yes      |
   | is_organization_trail         | Enable organization-wide trail for CloudTrail   | bool   | `false`                           | yes      |

3. **Initialize Terraform**  
   Run the following command to initialize the Terraform project:

   ```bash
   terraform init
   ```

4. **Plan the Infrastructure**  
   Generate and review the execution plan:

   ```bash
   terraform plan
   ```

   Optionally, save the plan to a file:

   ```bash
   terraform plan -out=plan.txt
   ```

5. **Apply the Configuration**  
   Apply the Terraform configuration to create the resources:

   ```bash
   terraform apply
   ```

6. **Destroy the Resources**  
   To clean up and remove all resources, run:

   ```bash
   terraform destroy
   ```

## Outputs

| Name              | Description                      |
| ----------------- | -------------------------------- |
| s3_bucket_id      | The ID of the created S3 bucket  |
| s3_bucket_arn     | The ARN of the created S3 bucket |
| cloudtrail_policy | The IAM policy for CloudTrail    |

## File Structure

```
.
├── backend.tf                # Backend configuration for Terraform state
├── main.tf                   # Main Terraform configuration
├── outputs.tf                # Outputs for the Terraform project
├── providers.tf              # Provider configuration
├── variables.tf              # Input variables for the project
├── terraform.tfvars          # Variable values for the project
├── versions.tf               # Terraform and provider version constraints
├── modules/
│   ├── cloudtrail/           # CloudTrail module
│   │   ├── main.tf           # CloudTrail resource definition
│   │   └── variables.tf      # Input variables for CloudTrail
│   ├── s3_bucket/            # S3 bucket module
│       ├── main.tf           # S3 bucket resource definition
│       ├── outputs.tf        # Outputs for the S3 bucket module
│       └── variables.tf      # Input variables for the S3 bucket
└── .terraform/               # Terraform state and provider files
```

## Notes

- Ensure that the backend bucket in `backend.tf` is updated to your own bucket name.
- The S3 bucket is configured to allow CloudTrail to write logs with the necessary permissions.
- The lifecycle rule for log retention is set to the number of days specified in `log_retention_days`.
