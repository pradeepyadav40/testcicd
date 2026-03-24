# Terraform CI/CD Pipeline with GitHub Actions

## Prerequisites and Installation

- Ensure you have a GitHub account.
- Install Terraform v1.14.7 on your local machine.
- Set up AWS CLI.

## AWS/Azure/GCP Account Setup

- Create accounts on AWS, Azure, and GCP.
- Set up necessary services like S3 buckets and DynamoDB tables for state management.

## OIDC Configuration Steps (Detailed)

1. Navigate to your GitHub repository settings.
2. Go to "Secrets and variables" and "Actions".
3. Add secrets for AWS_ACCOUNT_ID and AWS_ROLE_NAME.
4. Configure OIDC in AWS IAM to allow GitHub Actions to assume roles.

## GitHub Secrets Setup

- `AWS_ACCOUNT_ID`: Your AWS account ID.
- `AWS_ROLE_NAME`: The role name for AWS access.
- `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`
- `GCP_PROJECT_ID`, `GCP_WIP_PROVIDER`, `GCP_SERVICE_ACCOUNT`

## GitHub Environment Protection Setup

- Navigate to "Environments" in your repository settings.
- Set up protection rules for the `production` environment.

## Branch Protection Rules Configuration

- Go to "Branches" in your repository settings.
- Set protection rules for the `main` branch to prevent direct pushes.

## Deployment Workflow

- Trigger deployments by pushing to the `main` branch.
- Monitor deployments via GitHub Actions UI.

## Backend Setup

- Create an S3 bucket for Terraform state.
- Set up a DynamoDB table for state locking.

## Troubleshooting

- Check GitHub Actions logs for errors.
- Ensure Terraform version matches the required version.

## Cost Estimation

- Use AWS pricing calculator to estimate costs.

## Cleanup Procedures

- Run `terraform destroy` to remove resources.
- Delete artifacts from S3 bucket and DynamoDB table.