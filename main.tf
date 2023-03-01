################################################################
# AWS Private Key to Access Jump Host
################################################################
module "aws-eks-private-key"

{
  source                          = "git::git@github.com:thangap-cloud/aws-module-key-pair.git"
  key_name                        = var.aws-eks-private-key-name
  public_key                      = var.aws-eks-private-key-public-key
  private_key_algorithm           = var.aws-eks-private-key-algorithm
  private_key_rsa_bits            = var.aws-eks-private-key-rsa-bits
}

################################################################
# AWS EKS Cluster IAM Role
################################################################
module "aws-eks-iam-role" {
  source                          = "git::git@github.com:thangap-cloud/aws-module-iam-role.git"
  aws-iam-role-name               = var.aws-iam-role-name
  aws-iam-role-assume-role-policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
  EOF
  aws-iam-role-description      = var.aws-iam-role-description
  aws-iam-role-tags             = var.tags

}
################################################################
# AWS EKS Node IAM Role
################################################################
module "aws-eks-iam-node-role" {
  source                          = "git::git@github.com:thangap-cloud/aws-module-iam-role.git"
  aws-iam-role-name               = var.aws-eks-iam-node-role
  aws-iam-role-assume-role-policy = jsonencode({
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  })


  aws-iam-role-description = var.aws-eks-iam-node-role-description
  aws-iam-role-tags        = var.tags

}
################################################################
# AWS EKS CSI IAM Role
################################################################
module "aws-eks-iam-ebs-csi-controller-role" {
  source                          = "git::git@github.com:thangap-cloud/aws-module-iam-role.git"
  aws-iam-role-name               = var.aws-eks-iam-ebs-csi-controller-role
  aws-iam-role-assume-role-policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Federated": aws_iam_openid_connect_provider.openid.arn
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
          "StringEquals": {
            "${replace(aws_iam_openid_connect_provider.openid.url, "https://", "")}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
          }
        }
      }
    ]
  })
  aws-iam-role-description = var.aws-eks-iam-ebs-csi-controller-description
  aws-iam-role-tags        = var.tags

}
################################################################
# AWS EKS Cluster Node Autoscaler Policy
################################################################
module "aws-iam-role-policy-ClusterAutoscalerPolicy" {
  source                      = "git::git@github.com:thangap-cloud/aws-module-iam-role-policy.git"
  aws-iam-role-policy-name    = var.aws-iam-role-policy-ClusterAutoscalerPolicy-name
  aws-iam-role-policy-policy  = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  aws-iam-role-policy-role    = module.aws-eks-iam-node-role.role-id
}

################################################################
# AWS EKS Cluster EBS CSI Driver Policy
################################################################
module "aws-iam-role-policy-eks-ebs-csi-driver-policy" {
  source                      = "git::git@github.com:thangap-cloud/aws-module-iam-role-policy.git"
  aws-iam-role-policy-name    = var.aws-iam-role-policy-eks-ebs-csi-driver-policy-name
  aws-iam-role-policy-policy  = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:AttachVolume",
          "ec2:CreateSnapshot",
          "ec2:CreateTags",
          "ec2:CreateVolume",
          "ec2:DeleteSnapshot",
          "ec2:DeleteTags",
          "ec2:DeleteVolume",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeInstances",
          "ec2:DescribeSnapshots",
          "ec2:DescribeTags",
          "ec2:DescribeVolumes",
          "ec2:DescribeVolumesModifications",
          "ec2:DetachVolume",
          "ec2:ModifyVolume"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
  aws-iam-role-policy-role    = module.aws-eks-iam-node-role.role-id
}
################################################################
# AWS EKS Cluster KMS Key to Manage Secrets
################################################################
module "aws-kms-key" {
  source                            = "git::git@github.com:thangap-cloud/aws-module-kms.git"
  aws-kms-alias-name                = var.aws-kms-alias-name
  aws-kms-key-enable-key-rotation   = true
  aws-kms-key-description           = var.aws-kms-key-description
  aws-kms-key-enable-is-enabled     = true
}
################################################################
# AWS VPC
################################################################
module "aws-eks-vpc" {
  source                                = "git::git@github.com:thangap-cloud/aws-module-vpc.git"
  name                                  = var.aws-eks-vpc-name
  cidr                                  = var.aws-eks-vpc-cidr
  azs                                   = var.aws-eks-vpc-azs
  private_subnets                       = var.aws-eks-vpc-private-subnets
  private_subnet_names                  = var.aws-eks-vpc-private-subnet-names
  public_subnets                        = var.aws-eks-vpc-public-subnets
  public_subnet_names                   = var.aws-eks-vpc-public-subnet-names
  create_database_subnet_group          = false
  manage_default_network_acl            = true
  default_network_acl_tags              = var.tags
  manage_default_route_table            = true
  default_route_table_tags              = var.tags
  manage_default_security_group         = true
  default_security_group_tags           = var.tags
  enable_dns_hostnames                  = true
  enable_dns_support                    = true
  enable_nat_gateway                    = true
  single_nat_gateway                    = true
  enable_vpn_gateway                    = true
  enable_flow_log                       = true
  create_flow_log_cloudwatch_log_group  = true
  create_flow_log_cloudwatch_iam_role   = true
  flow_log_max_aggregation_interval     = 60
  tags                                  = var.tags
}

################################################################
# AWS EKS Cluster Security Group
################################################################
resource "aws_security_group" "eks_cluster" {
  name        = var.aws-eks-cluster-sg-name
  description = var.aws-eks-cluster-sg-description
  vpc_id      = module.aws-eks-vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

################################################################
# AWS EKS Cluster Node Security Group
################################################################
resource "aws_security_group" "eks_nodes" {
  name        = var.aws-eks-node-sg-name
  description = var.aws-eks-node-sg-description
  vpc_id      = module.aws-eks-vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = module.aws-eks-cluster.aws-eks-sg-id
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

################################################################
# AWS EKS Cluster Inbound Traffic Security Rule
################################################################
resource "aws_security_group_rule" "cluster_inbound" {
  from_port                = 0
  protocol                 = "-1"
  #security_group_id        = module.aws-eks-cluster.aws-eks-sg-id
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 0
  type                     = "ingress"
}

################################################################
# AWS EKS Cluster Jump Host Security Group
################################################################
resource "aws_security_group" "eks_bastion" {

  name         = var.aws-eks-node-bastion-sg-name
  description  = var.aws-eks-node-bastion-sg-description
  vpc_id       = module.aws-eks-vpc.vpc_id
  ingress {
    from_port = 0
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


 tags = var.tags
}


################################################################
# AWS EKS Cluster Jump Host
################################################################
module "aws-eks-node-bastion" {
  source                                              = "git::git@github.com:thangap-cloud/aws-module-bastion.git"
  aws-launch-configuration-name-prefix                = var.aws-eks-node-bastion-name
  aws-launch-configuration-image-id                   = var.aws-eks-node-bastion-image-id
  aws-launch-configuration-instance-type              = var.aws-eks-node-bastion-instance-type
  aws-launch-configuration-security-groups            = [aws_security_group.eks_bastion.id]
  aws-launch-configuration-associate-public-ip-address= true
  aws-launch-configuration-key-name                   = module.aws-eks-private-key.key_pair_name
  aws-launch-configuration-user-data                  = var.aws-eks-node-bastion-user-data
  aws-launch-configuration-volume-type                = var.aws-eks-node-bastion-volume-type
  aws-launch-configuration-volume-size                = var.aws-eks-node-bastion-volume-size
  aws-autoscaling-group-desired_capacity              = var.aws-eks-node-bastion-desired_capacity
  aws-autoscaling-group-max-size                      = var.aws-eks-node-bastion-group-max-size
  aws-autoscaling-group-min-size                      = var.aws-eks-node-bastion-group-min-size
  aws-autoscaling-group-vpc-zone-identifier           = module.aws-eks-vpc.public_subnets
}

################################################################
# AWS EKS Cluster
################################################################
module "aws-eks-cluster" {
  source                                          = "git::git@github.com:thangap-cloud/aws-module-eks.git"

  #Cluster
  aws-eks-cluster-name                            = var.aws-eks-cluster-name
  aws-eks-cluster-role-arn                        = module.aws-eks-iam-role.role-name-arn
  aws-eks-cluster-rolename                        = module.aws-eks-iam-role.role-name
  aws-eks-cluster-version                         = var.aws-eks-cluster-version
  aws-eks-cluster-sg                              = [aws_security_group.eks_cluster.id]
  aws-eks-cluster-private-subnet-ids              = module.aws-eks-vpc.private_subnets
  aws-eks-cluster-enabled-cluster-log-types       = var.aws-eks-cluster-enabled-cluster-log-types
  aws-eks-cluster-kms-resources-encryption        = var.aws-eks-cluster-kms-resources-encryption
  aws-eks-cluster-kms-key-arn                     = module.aws-kms-key.aws-kms-key-arn
  aws-eks-cluster-tags                            = var.tags

  #nodes
  aws-eks-node-group-node-group-name              = var.aws-eks-node-group-node-group-name
  aws-eks-node-group-node-role-arn                = module.aws-eks-iam-node-role.role-name-arn
  aws-eks-node-rolename                           = module.aws-eks-iam-node-role.role-name
  aws-eks-node-group-private-subnet-ids           = module.aws-eks-vpc.private_subnets
  aws-eks-node-group-labels                       = var.aws-eks-node-group-labels
  aws-eks-node-group-instance-types               = var.aws-eks-node-group-instance-types
  aws-eks-node-group-disk-size                    = var.aws-eks-node-group-disk-size
  aws-eks-node-group-version                      = var.aws-eks-cluster-version
  aws-eks-node-group-desired_size                 = var.aws-eks-node-group-desired_size
  aws-eks-node-group-max-size                     = var.aws-eks-node-group-max-size
  aws-eks-node-group-min-size                     = var.aws-eks-node-group-min-size
  aws-eks-node-group-bastion-key-pair             = module.aws-eks-private-key.key_pair_name
  aws-eks-node-group-bastion-security-group       = [aws_security_group.eks_bastion.id]

  #depends-on
  depends_on                                      = [module.aws-kms-key,module.aws-eks-vpc,module.aws-eks-private-key,module.aws-eks-node-bastion]

}

data "tls_certificate" "cert" {
  url             = module.aws-eks-cluster.aws-eks-cluster-identity.issuer

}

resource "aws_iam_openid_connect_provider" "openid" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cert.certificates[0].sha1_fingerprint]
  url             = module.aws-eks-cluster.aws-eks-cluster-identity.issuer
  depends_on      = [module.aws-eks-cluster]
}


