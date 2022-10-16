enable_private_nodes   = "false"  
auto_master_ipv4_cidr_block = "172.16.0.16/28"   # IP Range to be used by Google Managed Kubernetes Master Nodes 
kubernetes_version     = "1.22.12-gke.300"       # From GKE Cluster requirements
release_channel        = "regular"               # Release Channel Configuration
org                    = "valavan"               # Values will be used for VPC and GKE creation
product                = "notepad"               # Values will be used for VPC and GKE creation
environment            = "dev"                   # Values will be used for VPC and GKE creation
gcp_project_id         = "course-valavan"        # GCP Project ID 
gcp_region             = "us-central1"           # GCP Region 
network_auto_cidr      = "10.131.0.0/24"         # GKE Node Range IP Address 
pods_auto_cidr         = "10.1.0.0/16"           # GKE Pod Range IP Address
services_auto_cidr     = "10.100.2.0/23"         # GKE Service Range IP Address

