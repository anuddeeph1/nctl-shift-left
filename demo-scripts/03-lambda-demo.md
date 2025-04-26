# Lambda Policy Demo (10 minutes)

## 1. Introduction to Lambda Policies
"Now let's look at how we can secure AWS Lambda functions. We'll focus on three critical security aspects:
- Environment variable encryption
- VPC configuration
- Public access prevention"

## 2. Show the Policies
```bash
# Display the Lambda policies
cat controls/terraform-best-practices/lambda/check-env-var-encryption.yaml
cat controls/terraform-best-practices/lambda/check-lambda-vpc.yaml
cat controls/terraform-best-practices/lambda/check-lambda-public-access.yaml
```

## 3. Policy Deep Dive
"Let's examine each policy in detail..."

### Environment Variable Encryption
```yaml
# Point to these sections
metadata:
  name: check-env-var-encryption
  annotations:
    policies.kyverno.io/severity: high
```
"This policy ensures sensitive data in environment variables is always encrypted..."

### VPC Configuration
"The VPC policy ensures Lambda functions run in a controlled network environment..."

### Public Access
"This policy prevents unauthorized public access to Lambda functions..."

## 4. Live Demo
"Let me demonstrate these policies with real configurations..."

```bash
# Run scan on failing configuration
nctl scan terraform --policies controls/terraform-best-practices/lambda/ --resources config-files/terraform/lambda/failing-payload.json

# Show the failures and explain why they failed
```

```bash
# Run scan on passing configuration
nctl scan terraform --policies controls/terraform-best-practices/lambda/ --resources config-files/terraform/lambda/passing-payload.json

# Show how the passing configuration meets all requirements
```

## 5. Configuration Comparison
"Let's compare the failing and passing configurations..."

```bash
# Show the differences
diff config-files/terraform/lambda/failing-payload.json config-files/terraform/lambda/passing-payload.json
```

## 6. Best Practices
"When configuring Lambda functions, always:
- Use KMS encryption for environment variables
- Deploy in private VPC subnets when possible
- Implement proper IAM roles and policies
- Use API Gateway for public endpoints"

## 7. Common Questions
Q: "Does this affect Lambda's performance?"
A: "No, these are security best practices with minimal performance impact..."

Q: "What about quick prototypes?"
A: "Even for prototypes, security should be a priority..."

## 8. CI/CD Integration
"Here's how these checks integrate into your pipeline..."
```bash
# Show GitHub Actions workflow
cat .github/workflows/nctl-scan-terraform-demo-lambda.yml
```

## 9. Key Takeaways
- Automated security validation
- Consistent security controls
- Shift-left security practices
- Compliance as code

## 10. Transition
"Now that we've covered Lambda security, let's look at how these principles apply to EKS..." 