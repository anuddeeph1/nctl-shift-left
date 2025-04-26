# EKS Policy Demo (10 minutes)

## 1. Introduction to EKS Policies
"Let's explore how we can secure Amazon EKS clusters using Kyverno policies. We'll focus on a critical security aspect:
- Preventing public endpoint access"

## 2. Show the Policy
```bash
# Display the EKS public endpoint policy
cat controls/terraform-best-practices/eks/check-public-endpoint.yaml
```

## 3. Policy Breakdown
"Let's analyze this policy in detail..."

```yaml
# Point to these sections
metadata:
  name: check-public-endpoint
  annotations:
    policies.kyverno.io/severity: high
    policies.kyverno.io/description: >-
      This policy ensures that public access to the EKS cluster endpoint is explicitly set to false.
```

"The policy has several key components:
1. Metadata and severity level
2. Clear description of the security requirement
3. Specific validation rules"

## 4. Rule Logic
```yaml
rules:
  - name: check-public-endpoint
    match:
      any:
      - (planned_values.root_module.resources[?type=='aws_eks_cluster'] | length(@) > `0`): true
```
"This rule activates whenever an EKS cluster is being created or modified..."

## 5. Live Demo
"Let me show you this policy in action..."

```bash
# Run scan on failing configuration
nctl scan terraform --policies controls/terraform-best-practices/eks/check-public-endpoint.yaml --resources config-files/terraform/eks/failing-payload.json

# Run scan on passing configuration
nctl scan terraform --policies controls/terraform-best-practices/eks/check-public-endpoint.yaml --resources config-files/terraform/eks/passing-payload.json
```

## 6. Best Practices
"When configuring EKS clusters:
- Always use private endpoints
- Implement proper VPC design
- Use bastion hosts or AWS Systems Manager for cluster access
- Configure appropriate security groups"

## 7. Common Questions
Q: "How do I access the cluster if the endpoint is private?"
A: "Through VPN, Direct Connect, or bastion hosts..."

Q: "What about development environments?"
A: "Security best practices should apply to all environments..."

## 8. CI/CD Integration
"Let's see how these checks work in a CI/CD pipeline..."
```bash
# Show GitHub Actions workflow
cat .github/workflows/nctl-scan-terraform-demo-lambda.yml
```

## 9. Security Implications
"Public endpoints can lead to:
- Increased attack surface
- Potential unauthorized access
- Compliance violations
- Security breaches"

## 10. Key Takeaways
- Always use private endpoints
- Implement proper access controls
- Automate security validation
- Follow security best practices

## 11. Conclusion
"These policies help ensure that your EKS clusters remain secure and compliant with best practices..." 