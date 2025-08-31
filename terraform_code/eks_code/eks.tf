module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = local.name
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
  panda-node = {
    min_size     = 2
    max_size     = 4
    desired_size = 2

    # Use multiple instance types for better Spot success
    instance_types = ["t3.medium", "m5.large", "c5.large"]
    capacity_type  = "SPOT"

    tags = {
      ExtraTag = "Panda_Node"
    }
  }
}

  tags = local.tags
}
