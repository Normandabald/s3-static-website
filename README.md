# Static Website Deployment with Terraform and GitHub Actions on AWS

This repository provides a bootstrap setup to deploy and serve a static website using AWS services, Terraform for infrastructure as code, and GitHub Actions for CI/CD.
Mileage may vary for costs but unless you've got the next big thing, it should be around $0.60/month.

## Getting Started

Follow these steps to get started with deploying your static website on AWS.

### 1. Buy a Domain Name

Purchase a domain name from your preferred domain registrar (e.g., GoDaddy, Namecheap, etc.).

### 2. Create an AWS Account

If you don't have an AWS account, [create one here](https://aws.amazon.com/).

### 3. Create an S3 Bucket for Terraform State

1. Log in to your AWS Management Console.
2. Navigate to the S3 service.
3. Create a new S3 bucket to store your Terraform state files. Note down the bucket name as you will need it in the Terraform configuration.

### 4. Create IAM Access Keys (Optional but encouraged)

1. Navigate to the IAM service in your AWS Management Console.
2. Create a new IAM user with `programmatic access`.
3. Attach `AdministratorAccess` policy to the user or create a custom policy with necessary permissions.
4. Download the access key ID and secret access key. **Keep these credentials secure**.

### 5. Add Access Keys to GitHub Actions Secrets

1. In your GitHub repository, navigate to `Settings > Secrets and variables > Actions`.
2. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

### 6. Configure AWS Region Environment Variable in GitHub Actions

1. Navigate to your `.github/workflows` directory.
2. Open the workflow files and set the `AWS_REGION` environment variable to your desired AWS region (e.g., `us-east-1`).

Example:

```yaml
env:
  AWS_REGION: us-east-1
```

### 7. Configure S3_WEBSITE_BUCKET Value in [deploy-website.yaml](/.github/workflows/deploy-website.yaml)

1. Open the deploy-website.yaml workflow file located in .github/workflows/.
2. Set the S3_WEBSITE_BUCKET value to the name of the S3 bucket where your static website files will be stored.

Example:

```yaml
env:
  S3_WEBSITE_BUCKET: your-website-bucket-name
```

### 8. Configure Desired Values in [locals.tf](/terraform/locals.tf)

1. Navigate to the terraform/ directory.
2. Open the [locals.tf](/terraform/locals.tf) file.
3. Set your desired configuration values such as domain_name, bucket_name, and other parameters.

Example:

```hcl
locals {
    aws_region = "eu-west-2"
    tf_state_bucket_name = "tf-state-bucket"
    s3_bucket_name = "super-awesome-website"
    domain_name = "example.co.uk"
    root_file = "index.html"
    error_file = "error.html"
}
```

### 9. Configure DNS Nameservers in Domain Registrar

Follow guidance from the domain registrar you bought your domain from to configure the domain nameservers to point to AWS Route 53.

### 10. Push Changes to GitHub Repository

From a branch or directly push to `main` and let the Github Actions workflow take care of the rest!
The Terraform CD is manually triggered by default, but you can change this in the workflow file by adding an event trigger like on push or schedule.

```yaml
on:
  push:
    branches:
      - main
```

### 11. Deploy your resources using Terraform

With all of your config setup, you can now deploy your resources using Terraform. You can do this by running the `Terrafrom: CD` Github Actions workflow manually from the Actions tab in your repository.

### 12. Access your website

Assuming all went well (This whole process is (at time of writing) untested), you should now be able to access your website at the domain you configured.
