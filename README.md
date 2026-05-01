# AWS EKS Terraform Infrastructure

This repository contains Terraform configurations to deploy a fully functional Amazon EKS (Elastic Kubernetes Service) cluster on AWS.

---

## 📁 Project Structure

```
.
├── environments/          # Environment-specific configurations
│   ├── dev/              # Development environment (complete)
│   └── prod/             # Production environment (⚠️ incomplete)
│
├── modules/              # Reusable Terraform modules
│   ├── networks/         # VPC and networking resources
│   ├── iam/              # IAM roles and policies
│   ├── eks/              # EKS cluster and node groups
│   └── eks-access/       # EKS cluster access management
│
└── statefiles/           # Local Terraform state files
```

---

## 🧩 Modules Explained

### 1. Networks Module (`modules/networks/`)

Creates all the networking infrastructure needed for EKS:

| Resource | Purpose |
|----------|---------|
| **VPC** | Isolated network for your cluster |
| **Public Subnets (2)** | For load balancers and NAT gateway |
| **Private Subnets (2)** | For EKS worker nodes (more secure) |
| **Internet Gateway** | Allows public subnets to access internet |
| **NAT Gateway** | Allows private subnets to access internet (outbound only) |
| **Route Tables** | Controls traffic routing for public/private subnets |

### 2. IAM Module (`modules/iam/`)

Creates IAM roles required by EKS:

| Role | Purpose |
|------|---------|
| **EKS Cluster Role** | Allows EKS service to manage cluster resources |
| **Node Group Role** | Allows EC2 worker nodes to join the cluster and pull container images |

### 3. EKS Module (`modules/eks/`)

Creates the actual Kubernetes cluster:

| Resource | Purpose |
|----------|---------|
| **EKS Cluster** | The managed Kubernetes control plane |
| **Node Group** | EC2 instances that run your containers |

**Key Settings:**
- Authentication mode: `API_AND_CONFIG_MAP` (supports both methods)
- Endpoints: Both public and private access enabled
- Nodes run in private subnets for security

### 4. EKS Access Module (`modules/eks-access/`)

Manages who can access the cluster:

| Resource | Purpose |
|----------|---------|
| **IAM Role** | An assumable role for cluster admins |
| **Access Entry** | Registers the role with EKS |
| **Access Policy** | Grants `AmazonEKSClusterAdminPolicy` (full admin) |

Users in `admin_principal_arns` can assume this role to get cluster access.

---

## 🚀 Environments

### ✅ Development (`environments/dev/`)

**Status:** Complete and ready to use

This environment deploys:
- VPC with CIDR `10.1.0.0/16`
- EKS cluster named `tf-eks-cluster-dev`
- Kubernetes version `1.33`
- Node group with 2 `t3.small` instances

**To deploy:**
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

**To access the cluster after deployment:**
```bash
aws eks update-kubeconfig --name tf-eks-cluster-dev --region us-east-1
kubectl get nodes
```

### ⚠️ Production (`environments/prod/`)

**Status:** Incomplete - only has basic provider configuration

**What's missing:**
- Module references (networks, iam, eks, eks-access)
- Variable definitions
- Output definitions
- Backend configuration for remote state (recommended for prod)

---

## ⚙️ Configuration

All configurable values are in `terraform.tfvars` for each environment:

| Variable | Description | Example |
|----------|-------------|---------|
| `aws_region` | AWS region to deploy in | `us-east-1` |
| `environment` | Environment name (used in resource naming) | `dev` |
| `vpc_cidr_block` | CIDR block for VPC | `10.1.0.0/16` |
| `cluster_name` | Name prefix for EKS cluster | `tf-eks-cluster` |
| `kubernetes_version` | Kubernetes version | `1.33` |
| `node_group_instance_types` | EC2 instance types for nodes | `["t3.small"]` |
| `admin_principal_arns` | IAM ARNs that can access cluster | `["arn:aws:iam::xxx:user/name"]` |

---

## 📋 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0
- kubectl (for cluster access)

---

## 💡 Notes

- State files are stored locally in `statefiles/` directory
- For production, consider using S3 + DynamoDB for remote state
- The cluster creator automatically gets admin access (no extra config needed)
