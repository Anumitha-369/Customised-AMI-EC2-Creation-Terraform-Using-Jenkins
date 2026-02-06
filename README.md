# 🚀 End-to-End DevOps Automation: 
# EC2 Deployment from Custom AMI using Terraform & Jenkins

---

## 📌 Project Overview

This project demonstrates how to:

- Create an EC2 instance manually
- Install **Java** and **Nginx**
- Create a custom AMI from that instance
- Use **Terraform** to launch a new EC2 instance from the custom AMI
- Clean up resources after completion

### 🎯 This project helps in understanding:

- EC2 provisioning
- AMI creation
- Infrastructure as Code (IaC) using Terraform
- Security Groups configuration

---

## 🛠️ Step 1: Create EC2 Instance (Manual Setup)

1. Go to **AWS Console → EC2**
2. Click **Launch Instance**
3. Choose **Amazon Linux**
4. Select instance type: `t2.micro`
5. Create / Select a key pair
6. Configure Security Group:
   - Allow **SSH (Port 22)**
   - Allow **HTTP (Port 80)**

### 🔐 Connect to EC2

```bash
sudo yum install java -y
sudo yum install nginx -y
✅ Now your server has:

Java installed

Nginx installed

🖼️ Step 2: Create Custom AMI

Go to EC2 → Instances

Select your instance

Click:

Actions → Images & Templates → Create Image
Provide image name

Click Create Image

Copy the generated AMI ID

📂 Step 3: Terraform Configuration

Create the following files:

> provider.tf

> Ec2.tf

🚀 Step 4: Jenkins CI/CD Automation

🔐 Add AWS Credentials in Jenkins

Go to:

Jenkins → Manage Jenkins → Credentials → Add Credentials

Credential 1 – AWS Access Key

Kind: Secret text

ID: aws-access-key-id

Credential 2 – AWS Secret Access Key

Kind: Secret text

ID: aws-secret-access-key

🧩 Step 5: Jenkins Pipeline

Create a Pipeline Job and use the following configuration:

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('#######')
        AWS_SECRET_ACCESS_KEY = credentials('#######')
        AWS_DEFAULT_REGION    = '######'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-repository-url.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
    }
}

<img width="1187" height="842" alt="Screenshot 2026-02-06 141042" src="https://github.com/user-attachments/assets/edf1a763-2d8f-4d93-a240-9b0debc9255f" />

<img width="1265" height="743" alt="Screenshot 2026-02-06 140938" src="https://github.com/user-attachments/assets/ee4e97f4-6cc1-4f15-8afe-103d9a10da64" />

🧹 Cleanup Resources
Terminate EC2 Instance

Go to:

> EC2 → Instances → Terminate

- De-register AMI

> Go to EC2 → AMIs

- Select your custom AMI

Click:

> Actions → Deregister

------------------------------------------------------------------------------------------------------------------------------------

Delete associated snapshots

📚 Concepts Covered

☁️ EC2 Provisioning
Creating and managing EC2 instances in AWS.

🖼️ Custom AMI Creation
Building a reusable AMI with pre-installed Java and Nginx.

🔐 Security Groups
Configuring SSH and HTTP access securely.

⚙️ Terraform AWS Provider
Using Terraform to manage AWS resources.

🏗️ Infrastructure as Code (IaC)
Automating infrastructure provisioning.

🔄 Resource Lifecycle Management

Managing infrastructure using:

terraform init
terraform plan
terraform apply
terraform destroy

🔁 Jenkins CI/CD Pipeline

- Automating Terraform workflow using Jenkins pipeline stages:
- Code checkout
- Initialization
- Planning
- Apply


#AWS #EC2 #Terraform #DevOps #Cloud  #InfrastructureAsCode #AMI  #Nginx  #Java
