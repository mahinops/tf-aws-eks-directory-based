### terraform plan

```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.eks.aws_eks_cluster.main will be created
  + resource "aws_eks_cluster" "main" {
      + arn                           = (known after apply)
      + bootstrap_self_managed_addons = true
      + certificate_authority         = (known after apply)
      + cluster_id                    = (known after apply)
      + created_at                    = (known after apply)
      + deletion_protection           = (known after apply)
      + endpoint                      = (known after apply)
      + id                            = (known after apply)
      + identity                      = (known after apply)
      + name                          = "tf-eks-cluster-dev"
      + platform_version              = (known after apply)
      + region                        = "us-east-1"
      + role_arn                      = (known after apply)
      + status                        = (known after apply)
      + tags                          = {
          + "Name" = "tf-eks-cluster-dev"
        }
      + tags_all                      = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "tf-eks-cluster-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + version                       = "1.33"

      + access_config {
          + authentication_mode = "API_AND_CONFIG_MAP"
        }

      + compute_config (known after apply)

      + control_plane_scaling_config (known after apply)

      + kubernetes_network_config (known after apply)

      + storage_config (known after apply)

      + upgrade_policy (known after apply)

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = true
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + subnet_ids                = (known after apply)
          + vpc_id                    = (known after apply)
        }
    }

  # module.eks.aws_eks_node_group.name will be created
  + resource "aws_eks_node_group" "name" {
      + ami_type               = (known after apply)
      + arn                    = (known after apply)
      + capacity_type          = "ON_DEMAND"
      + cluster_name           = "tf-eks-cluster-dev"
      + disk_size              = 20
      + id                     = (known after apply)
      + instance_types         = [
          + "t3.small",
        ]
      + node_group_name        = "tf-eks-cluster-dev-node-group"
      + node_group_name_prefix = (known after apply)
      + node_role_arn          = (known after apply)
      + region                 = "us-east-1"
      + release_version        = (known after apply)
      + resources              = (known after apply)
      + status                 = (known after apply)
      + subnet_ids             = (known after apply)
      + tags                   = {
          + "Name" = "tf-eks-cluster-dev-node-group"
        }
      + tags_all               = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "tf-eks-cluster-dev-node-group"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + version                = (known after apply)

      + node_repair_config (known after apply)

      + scaling_config {
          + desired_size = 2
          + max_size     = 3
          + min_size     = 1
        }

      + update_config {
          + max_unavailable = 1
        }
    }

  # module.eks-access.aws_eks_access_entry.eks-admin-access["arn:aws:iam::922344941106:user/mahin"] will be created
  + resource "aws_eks_access_entry" "eks-admin-access" {
      + access_entry_arn  = (known after apply)
      + cluster_name      = "tf-eks-cluster-dev"
      + created_at        = (known after apply)
      + id                = (known after apply)
      + kubernetes_groups = (known after apply)
      + modified_at       = (known after apply)
      + principal_arn     = "arn:aws:iam::922344941106:user/mahin"
      + region            = "us-east-1"
      + tags_all          = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + type              = "STANDARD"
      + user_name         = (known after apply)
    }

  # module.eks-access.aws_eks_access_policy_association.eks-admin-policy["arn:aws:iam::922344941106:user/mahin"] will be created
  + resource "aws_eks_access_policy_association" "eks-admin-policy" {
      + associated_at = (known after apply)
      + cluster_name  = "tf-eks-cluster-dev"
      + id            = (known after apply)
      + modified_at   = (known after apply)
      + policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      + principal_arn = "arn:aws:iam::922344941106:user/mahin"
      + region        = "us-east-1"

      + access_scope {
          + type = "cluster"
        }
    }

  # module.iam.aws_iam_role.eks_cluster_role will be created
  + resource "aws_iam_role" "eks_cluster_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-cluster-dev-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Name" = "eks-cluster-dev-role"
        }
      + tags_all              = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-cluster-dev-role"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.iam.aws_iam_role.eks_nodegroup_role will be created
  + resource "aws_iam_role" "eks_nodegroup_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-nodegroup-dev-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Name" = "eks-nodegroup-dev-role"
        }
      + tags_all              = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-nodegroup-dev-role"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.iam.aws_iam_role_policy_attachment.eks_cluster_policy will be created
  + resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "eks-cluster-dev-role"
    }

  # module.iam.aws_iam_role_policy_attachment.eks_cni_policy will be created
  + resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = "eks-nodegroup-dev-role"
    }

  # module.iam.aws_iam_role_policy_attachment.eks_container_registry_policy will be created
  + resource "aws_iam_role_policy_attachment" "eks_container_registry_policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = "eks-nodegroup-dev-role"
    }

  # module.iam.aws_iam_role_policy_attachment.eks_worker_node_policy will be created
  + resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = "eks-nodegroup-dev-role"
    }

  # module.networks.aws_eip.nat will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "us-east-1"
      + tags                 = {
          + "Name" = "eks-nat-eip-dev"
        }
      + tags_all             = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-nat-eip-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
    }

  # module.networks.aws_internet_gateway.main will be created
  + resource "aws_internet_gateway" "main" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "us-east-1"
      + tags     = {
          + "Name" = "eks-igw-dev"
        }
      + tags_all = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-igw-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id   = (known after apply)
    }

  # module.networks.aws_nat_gateway.main will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + auto_provision_zones               = (known after apply)
      + auto_scaling_ips                   = (known after apply)
      + availability_mode                  = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "us-east-1"
      + regional_nat_gateway_address       = (known after apply)
      + regional_nat_gateway_auto_mode     = (known after apply)
      + route_table_id                     = (known after apply)
      + secondary_allocation_ids           = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name" = "eks-nat-dev"
        }
      + tags_all                           = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-nat-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id                             = (known after apply)
    }

  # module.networks.aws_route_table.private will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + nat_gateway_id             = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "eks-private-rt-dev"
        }
      + tags_all         = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-private-rt-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id           = (known after apply)
    }

  # module.networks.aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "eks-public-rt-dev"
        }
      + tags_all         = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-public-rt-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id           = (known after apply)
    }

  # module.networks.aws_route_table_association.private-1 will be created
  + resource "aws_route_table_association" "private-1" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networks.aws_route_table_association.private-2 will be created
  + resource "aws_route_table_association" "private-2" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networks.aws_route_table_association.public-1 will be created
  + resource "aws_route_table_association" "public-1" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networks.aws_route_table_association.public-2 will be created
  + resource "aws_route_table_association" "public-2" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networks.aws_subnet.subnet-private-1 will be created
  + resource "aws_subnet" "subnet-private-1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.1.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Name" = "eks-subnet-private-1-dev"
        }
      + tags_all                                       = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-subnet-private-1-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networks.aws_subnet.subnet-private-2 will be created
  + resource "aws_subnet" "subnet-private-2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.1.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Name" = "eks-subnet-private-2-dev"
        }
      + tags_all                                       = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-subnet-private-2-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networks.aws_subnet.subnet-public-1 will be created
  + resource "aws_subnet" "subnet-public-1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.1.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Name" = "eks-subnet-public-1-dev"
        }
      + tags_all                                       = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-subnet-public-1-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networks.aws_subnet.subnet-public-2 will be created
  + resource "aws_subnet" "subnet-public-2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.1.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Name" = "eks-subnet-public-2-dev"
        }
      + tags_all                                       = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-subnet-public-2-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networks.aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.1.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = "us-east-1"
      + tags                                 = {
          + "Name" = "eks-vpc-dev"
        }
      + tags_all                             = {
          + "Author"      = "Mokhlesur Mahin"
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Name"        = "eks-vpc-dev"
          + "Project"     = "tf-workspace-aws-eks"
        }
    }

Plan: 24 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cluster_arn                   = (known after apply)
  + cluster_certificate_authority = (known after apply)
  + cluster_endpoint              = (known after apply)
  + cluster_name                  = "tf-eks-cluster-dev"
  + eks_cluster_id                = (known after apply)
  + iam_role_arn                  = (known after apply)
  + iam_role_name                 = "eks-cluster-dev-role"
  + internet_gateway_id           = (known after apply)
  + nat_gateway_id                = (known after apply)
  + nodegroup_role_arn            = (known after apply)
  + nodegroup_role_name           = "eks-nodegroup-dev-role"
  + private_route_table_id        = (known after apply)
  + private_subnet_ids            = [
      + (known after apply),
      + (known after apply),
    ]
  + public_route_table_id         = (known after apply)
  + public_subnet_ids             = [
      + (known after apply),
      + (known after apply),
    ]
  + vpc_cidr_block                = "10.1.0.0/16"
  + vpc_id                        = (known after apply)
```