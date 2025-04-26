# Demo Preparation Checklist

## 1. Environment Setup
- [ ] Clone the repository
- [ ] Install required tools:
  ```bash
  # Install nctl
  brew tap nirmata/tap
  brew install nctl
  
  # Verify installation
  nctl version
  ```
- [ ] Check AWS credentials are set up
- [ ] Test all commands beforehand

## 2. Repository Check
- [ ] Verify all policy files are present:
  - ECS policies in `controls/terraform-best-practices/ecs/`
  - Lambda policies in `controls/terraform-best-practices/lambda/`
  - EKS policies in `controls/terraform-best-practices/eks/`
- [ ] Confirm test configurations exist:
  - Failing payloads
  - Passing payloads
- [ ] GitHub Actions workflow is ready

## 3. Demo Environment
- [ ] Clean terminal window
- [ ] Increased font size for visibility
- [ ] Dark theme for better contrast
- [ ] Multiple terminal tabs ready:
  - One for policy viewing
  - One for running scans
  - One for showing configurations

## 4. Backup Plan
- [ ] Screenshots of expected outputs
- [ ] Copy of all commands in a text file
- [ ] Offline copies of all configurations
- [ ] Alternative demo flow if time runs short

## 5. Presentation Materials
- [ ] Demo scripts printed or readily available
- [ ] Key points highlighted
- [ ] Timing noted for each section
- [ ] Q&A preparation

## 6. Technical Checks
- [ ] Internet connection
- [ ] AWS access
- [ ] GitHub access
- [ ] Terminal setup
- [ ] Editor setup

## 7. Rehearsal
- [ ] Run through entire demo
- [ ] Time each section
- [ ] Practice explaining policies
- [ ] Test all commands
- [ ] Prepare for common questions

## 8. Day of Presentation
- [ ] Arrive early
- [ ] Test AV equipment
- [ ] Check internet connection
- [ ] Have water ready
- [ ] Deep breaths and stay calm

## 9. Quick Reference
Common Commands:
```bash
# Policy scan commands
nctl scan terraform --policies controls/terraform-best-practices/ecs/ --resources config-files/terraform/ecs/failing-payload.json
nctl scan terraform --policies controls/terraform-best-practices/lambda/ --resources config-files/terraform/lambda/failing-payload.json
nctl scan terraform --policies controls/terraform-best-practices/eks/ --resources config-files/terraform/eks/failing-payload.json

# View policies
cat controls/terraform-best-practices/ecs/validate-ecs-task-public-ip.yaml
cat controls/terraform-best-practices/lambda/check-env-var-encryption.yaml
cat controls/terraform-best-practices/eks/check-public-endpoint.yaml

# Show configurations
cat config-files/terraform/lambda/passing-payload.json
cat config-files/terraform/lambda/failing-payload.json
```

## 10. Emergency Contacts
- [ ] Event organizer: [Contact]
- [ ] Technical support: [Contact]
- [ ] Backup presenter: [Contact] 