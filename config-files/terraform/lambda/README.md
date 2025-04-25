# AWS Lambda Function Terraform Configuration

This directory contains Terraform configuration to deploy an AWS Lambda function.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed
- Node.js 18.x (for local development)

## Directory Structure

```
.
├── main.tf          # Main Terraform configuration
├── variables.tf     # Variable definitions
├── src/            # Lambda function source code
│   └── index.js    # Lambda function handler
└── README.md       # This file
```

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

## Configuration

The following variables can be customized in `variables.tf`:

- `region`: AWS region (default: us-west-1)
- `function_name`: Name of the Lambda function (default: example-lambda-function)
- `environment`: Environment name (default: dev)

## Lambda Function

The sample Lambda function:
- Uses Node.js 18.x runtime
- Logs the incoming event
- Returns a simple JSON response with a greeting and environment information
- Has CloudWatch Logs enabled with 14-day retention
- Uses the AWSLambdaBasicExecutionRole for logging

## Cleanup

To destroy all created resources:
```bash
terraform destroy
``` 