variable "aws-eks-private-key-name" {
  type    = string
  default = "aws-eks-private-key"
  description = "private key name for to log in to eks worker nodes"
}

variable "aws-eks-private-key-public-key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUSmojsuTFBfWIyjEd+fKR2QUx2W+JrT0RXFudZAknPHpvm/vokGBeldkE2lp/aad01qeOOglHfJQDd5LSIdXOHTkyx+ZaDVeofAsEPm5JNr3rWQz3e32Br5tYwZBcecWvdss2Zx9Hzhx5pq/K0JfOC8GsevBa4MsdbDu/2S8neVtSaf88UjgOqUkM5aaO4D1hatZH7UCtmD41PGiStk60mf9pt0YU4tTynga+fMqpSVyC6R39ag41GIapZgKHsVaPwVH5cS8remKu2W8g42ZtiRhYb8kMkPzVwJM2RdHVjYG+31fUyRHSCchHfTF8NjBRhTg5I/fH/Ymkoj5P4sPIJCL6UtXV5S8sE8OWczn05e4hlRMMbCy1ncljP2/IcjcRrI1Jr0HJVMsCBvoM+Oec4Z2gEeFCy43Rr3oLy8yUK1tuM0HV6pnyhzhw07WnNx2+BBxGfrCIBZbm8F9xPkLSOoRE0HGPukajxqhX958/b8Ou1FSt8DWD0oARiou4SQm7rlnWVs3jZl9cGRy9bH5U0IpZAFrdQOnOfXnK1Y3Yh9BtMgxozbKCTTePVRzg5tJwU4gkmEjItFxDxTWKYHDzX6h9iUiEL1oTq6ZuYL7EdM39Sz41whfaADAlUlphHDhsHXvxr2MH5btNjXPsWzB1kE1RarSosG82Xq4BuaZ7QQ== thangap.aws01@gmail.com"
  description = "users public key"
}

variable "aws-eks-private-key-algorithm" {
  type    = string
  default = "RSA"
  description = "private key algorithm to be used"
}

variable "aws-eks-private-key-rsa-bits" {
  description = "When algorithm is `RSA`, the size of the generated RSA key, in bits (default: `4096`)"
  type        = number
  default     = 4096
}

variable "aws-iam-role-name" {
  type    = string
  default = "aws-eks-iam-role"
  description = "aws eks cluster iam role"
}

variable "aws-iam-role-description" {
  type    = string
  default = "aws eks i am role"
  description = "aws eks cluster iam role description"
}

variable "tags" {
  type    = map(any)
  default = {}
  description = "tags to be applied to the resources"
}

variable "aws-kms-alias-name" {
  type    = string
  default = "alias/aws-kms-key-alias-app"
  description = "aws kms key alias name"
}

variable "aws-kms-key-description" {
  type    = string
  default = "aws kms key"
  description = "aws kms key description"

}

variable "aws-eks-cluster-enabled-cluster-log-types" {
  type    = list(any)
  default = ["api", "audit", "authenticator"]
  description = "kubernetes cluster logs to be enabled"
}

variable "aws-eks-cluster-name" {
  type    = string
  default = "aws-eks-app"
  description = "name of the eks cluster to be created"
}

variable "aws-eks-cluster-version" {
  type    = string
  default = "1.24"
  description = "k8s version to be created"
}

variable "aws-eks-cluster-kms-resources-encryption" {
  type    = list
  default = ["secrets"]
  description = "list of k8s resources to be encrypted by kms"
}

variable "aws-eks-iam-node-role" {
  type    = string
  default = "aws-eks-node-role"
  description = "aws eks node creation role name"
}

variable "aws-eks-iam-node-role-description" {
  type    = string
  default = "aws eks node"
  description = "aws eks node role"
}

variable "aws-eks-iam-ebs-csi-controller-role" {
  type    = string
  default = "aws-eks-iam-ebs-csi-role-app"
  description = "aws eks csi controller role"
}

variable "aws-eks-iam-ebs-csi-controller-description" {
  type    = string
  default = "aws eks csi controller"
  description = "aws eks csi controller role description"
}

variable "aws-iam-role-policy-eks-ebs-csi-driver-policy-name" {
  type    = string
  default = "aws-iam-role-policy-eks-ebs-csi-driver-policy"
  description = "aws eks ebs csi driver policy name"
}

variable "aws-iam-role-policy-ClusterAutoscalerPolicy-name" {
  type    = string
  default = "aws-iam-role-policy-ClusterAutoscalerPolicy"
  description = "cluster autoscaler policy name"
}

variable "aws-eks-vpc-name" {
  type    = string
  default = "aws-eks-vpc"
  description = "custom vpc name"
}

variable "aws-eks-vpc-cidr" {
  type  = string
  default = "10.0.0.0/16"
  description = "custom vpc cidr range"

}

variable "aws-eks-vpc-azs" {
  type    = list(any)
  default = []
  description = "custom vpc az's"
}

variable "aws-eks-vpc-private-subnets" {
  type    = list(any)
  default = []
  description = "custom vpc private subnet cidr"
}

variable "aws-eks-vpc-private-subnet-names" {
  type    =  list(string)
  default = []
  description = "custom vpc public subnet names"
}

variable "aws-eks-vpc-public-subnets" {
  type    = list(any)
  default = []
  description = "custom vpc public subnet cidr"
}

variable "aws-eks-vpc-public-subnet-names" {
  type    = list(string)
  default = []
  description = "custom vpc public subnet names"
}

variable "aws-eks-node-group-node-group-name" {
  type    = string
  default = "aws-eks-node-group-app"
  description = "eks node group name"
}

variable "aws-eks-node-group-labels" {
  type    = map(any)
  default = {}
  description = "eks node group labels"
}

variable "aws-eks-node-group-instance-types" {
  type    = list(any)
  default = ["t3.large"]
  description = "eks node group instance types"
}

variable "aws-eks-node-sg-name" {
  type    = string
  default = "aws-eks-node-sg"
  description = "eks node group security group name"
}

variable "aws-eks-node-sg-description" {
  type    = string
  default = "aws eks node group"
  description = "eks node group security group description"
}

variable "aws-eks-node-group-disk-size" {
  type    = string
  default = "200"
  description = "eks node disk size"
}

variable "aws-eks-node-group-version" {
  type    = string
  default = "1,24"
  description = "eks node group k8s version"
}

variable "aws-eks-node-group-desired_size" {
  type    = string
  default = "2"
  description = "eks asg node desired size"
}

variable "aws-eks-node-group-max-size" {
  type    = string
  default = "4"
  description = "eks asg node maximum size"
}

variable "aws-eks-node-group-min-size" {
  type    = string
  default = "2"
  description = "eks asg node minimum size"
}

variable "aws-eks-cluster-sg-name" {
  type    = string
  default = "aws-eks-cluster-sg"
  description = "eks cluster sg name"

}

variable "aws-eks-cluster-sg-description" {
  type    = string
  default = "aws eks sg"
  description = "eks cluster group security group description"
}

variable "aws-eks-node-bastion-name" {
  type = string
  default = "aws-eks-node-bastion"
  description = "jump host name to access eks nodes"
}

variable "aws-eks-node-bastion-instance-type" {
  type = string
  default = "t2.micro"
  description = "jump host instance type"
}

variable "aws-eks-node-bastion-configuration-key-name" {
  type = string
  default = "key-pair-name"
  description = "jump host  key pair"
}

variable "aws-eks-node-bastion-user-data" {
  type = string
  default = ""
  description = "init scripts for jump host"
}

variable "aws-eks-node-bastion-volume-type" {
  type = string
  default = "gp2"
  description = "jump host volume type"
}

variable "aws-eks-node-bastion-volume-size" {
  type = string
  default = "50"
  description = "jump host voume size"
}

variable "aws-eks-node-bastion-desired_capacity" {
  type = string
  default = "1"
  description = "jump host desired size"

}

variable "aws-eks-node-bastion-group-max-size" {
  type = string
  default = "2"
  description = "jump host maximum size"
}

variable "aws-eks-node-bastion-group-min-size" {
  type = string
  default = "1"
  description = "jump host minimum size"
}

variable "aws-eks-node-bastion-sg-name" {
  type = string
  default = "aws-eks-node-bastion-sg"
  description = "jump host sg name"
}

variable "aws-eks-node-bastion-sg-description" {
  type = string
  default = "jump host sg"
  description = "jump host sg name description"
}

variable "aws-eks-iam-elb-role" {
  type  = string
  default = "aws-eks-iam-elb-role"
  description = "aws eks elb iam role name"
}

variable "aws-eks-iam-elb-role-description" {
  type  = string
  default = "aws eks elb iam role"
  description = "aws eks elb iam role description"
}

variable "aws-iam-role-policy-eks-elb-policy-name" {
  type = string
  default = "aws-iam-role-policy-eks-elb-policy"
  description = "aws eks elb iam role policy name"
}

variable "values_file" {
  description = "The name of the ArgoCD helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "elb-sa-name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "aws elb service account name used by cluster"
}

variable "ebs-csi-sa-name" {
  type        = string
  default     = "ebs-csi-controller-sa"
  description = "ws ebs csi driver service account name"
}