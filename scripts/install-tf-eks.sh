#!/bin/bash
set -e

# Function to install Terraform
install_terraform() {
    echo "Installing Terraform..."
    # Download Terraform binary
    wget https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_amd64.zip
    # Unzip the downloaded file
    unzip terraform_1.7.0_linux_amd64.zip
    # Move Terraform binary to /usr/local/bin
    sudo mv terraform /usr/local/bin/
    echo "Terraform installed successfully."
}

# Function to run Terraform commands
run_terraform_commands() {
    cd config-files/terraform/eks
    echo "Running Terraform commands..."
    
    # Initialize Terraform
    terraform init -upgrade || {
        echo "Terraform init failed";
        terraform version;
        exit 1;
    }
    
    # Plan the changes Terraform will make - with no state refresh (scan only mode)
    terraform plan -refresh=false -out tfplan.binary || {
        echo "Terraform plan failed";
        exit 1;
    }
    
    # Store in JSON
    terraform show -json tfplan.binary > terraform_plan.json || {
        echo "Terraform show failed";
        exit 1;
    }
    
    # Process with jq if available
    if command -v jq &> /dev/null; then
        cat terraform_plan.json | jq > payload.json || {
            echo "jq processing failed, using raw output";
            cp terraform_plan.json payload.json;
        }
    else
        cp terraform_plan.json payload.json
    fi
    
    echo "Terraform commands executed successfully."
}

# Check if Terraform is already installed
if command -v terraform &> /dev/null; then
    echo "Terraform is already installed."
    terraform version
    run_terraform_commands
else
    install_terraform
    terraform version
    run_terraform_commands
fi

