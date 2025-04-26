# ECS Policy Demo (10 minutes)

## 1. Introduction to ECS Policy
"Let's start with ECS - Elastic Container Service. One of the critical security concerns is preventing public exposure of our containers."

## 2. Show the Policy File
```bash
# Display the ECS public IP policy
cat controls/terraform-best-practices/ecs/validate-ecs-task-public-ip.yaml
```

## 3. Policy Breakdown
"Let's break down this policy:

1. **Policy Purpose**
   - Prevents ECS tasks from getting public IPs
   - Reduces attack surface
   - Enforces security best practices

2. **Key Components**
   ```yaml
   # Point to these sections in the policy
   metadata:
     name: validate-ecs-task-public-ip
     annotations:
       policies.kyverno.io/severity: medium
   ```
   "This tells us about the policy's purpose and severity..."

3. **Rule Logic**
   ```yaml
   # Show the match and assert sections
   rules:
     - name: validate-ecs-task-public-ip
       match: ...
       assert: ...
   ```
   "The policy checks for any ECS service and ensures public IPs are disabled..."

## 4. Live Demo
"Let me show you this policy in action..."

```bash
# Run the scan on a failing configuration
nctl scan terraform --policies controls/terraform-best-practices/ecs/validate-ecs-task-public-ip.yaml --resources config-files/terraform/ecs/failing-payload.json

# Run the scan on a passing configuration
nctl scan terraform --policies controls/terraform-best-practices/ecs/validate-ecs-task-public-ip.yaml --resources config-files/terraform/ecs/passing-payload.json
```

## 5. Best Practices
"Instead of public IPs, you should:
- Use private subnets for tasks
- Configure NAT gateways for outbound traffic
- Use load balancers for public access
- Implement proper network segmentation"

## 6. Common Questions
Q: "How do tasks communicate without public IPs?"
A: "Through NAT gateways and load balancers..."

Q: "What about debugging?"
A: "Use Systems Manager Session Manager or bastion hosts..."

## 7. CI/CD Integration
"Let me show you how this integrates with GitHub Actions..."
```bash
# Show the GitHub Actions workflow
cat .github/workflows/nctl-scan-terraform-demo-lambda.yml
```

## 8. Key Takeaways
- Security by default
- Infrastructure as Code validation
- Automated compliance checks
- Reduced attack surface

## 9. Transition
"Now that we've seen how to secure ECS tasks, let's look at how we can apply similar principles to EKS..." 