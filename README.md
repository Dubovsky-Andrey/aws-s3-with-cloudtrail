# Terraform simple_s3_bucket

A Terraform module that creates a simple AWS S3 bucket with configurable options.

## Features

- Creates a basic S3 bucket
- Configurable bucket versioning
- Optional bucket encryption
- Tags with project and environment variables
- Uploads files from a local folder

## Requirements

- Terraform >= 1.11.3
- hashicorp/aws >= "~> 5.94.1"
- AWS Account with appropriate permissions

## Usage

1. **Generate MIME Types**  
   Run `Get-TerraformMimeTypes.ps1` to generate MIME types from the `modules/s3_bucket/files` folder. The output will be written to the local variable in `modules/s3_bucket/main.tf`.

2. **Configure Variables**  
   Change the required variables in your tfvars file.

   ### Input Variables in terraform.tfvars

   | Name                 | Description                  | Type   | Example Value                     | Required |
   | -------------------- | ---------------------------- | ------ | --------------------------------- | -------- |
   | aws_region           | The region for the S3 bucket | string | `us-east-1`                       | yes      |
   | project_name         | The name of the project      | string | `simple_s3_bucket`                | yes      |
   | environment          | The environment name         | string | `dev`                             | yes      |
   | bucket_name          | The name of the S3 bucket    | string | `my-unique-bucket-name-2025-1111` | yes      |
   | files_folder_name    | The name of the files folder | string | `modules/s3_bucket/files`         | yes      |
   | versioning_enabled   | Enable versioning            | bool   | `true`                            | yes      |
   | encryption_enabled   | Enable encryption            | bool   | `true`                            | yes      |
   | encryption_algorithm | Encryption algorithm         | string | `AES256`                          | yes      |

3. **Change backend bucket**

   Change the backend bucket name in `backend.tf` to your own bucket name.

4. **Initialize Terraform**

   ```
   terraform init
   ```

5. **Run Terraform Plan**

   ```
   terraform plan
   ```

   or

   ```
   terraform plan -out=plan.txt
   ```

6. **Run Terraform Apply**
   ```
   terraform apply
   ```
7. _Destroy the resources_
   ```
   terraform destroy
   ```

## Outputs

| Name       | Description            |
| ---------- | ---------------------- |
| bucket_id  | The name of the bucket |
| bucket_arn | The ARN of the bucket  |
