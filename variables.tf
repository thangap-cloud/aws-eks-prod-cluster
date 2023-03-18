variable "aws-eks-private-key-name" {
  type    = string
  default = ""
}

variable "aws-eks-private-key-public-key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUSmojsuTFBfWIyjEd+fKR2QUx2W+JrT0RXFudZAknPHpvm/vokGBeldkE2lp/aad01qeOOglHfJQDd5LSIdXOHTkyx+ZaDVeofAsEPm5JNr3rWQz3e32Br5tYwZBcecWvdss2Zx9Hzhx5pq/K0JfOC8GsevBa4MsdbDu/2S8neVtSaf88UjgOqUkM5aaO4D1hatZH7UCtmD41PGiStk60mf9pt0YU4tTynga+fMqpSVyC6R39ag41GIapZgKHsVaPwVH5cS8remKu2W8g42ZtiRhYb8kMkPzVwJM2RdHVjYG+31fUyRHSCchHfTF8NjBRhTg5I/fH/Ymkoj5P4sPIJCL6UtXV5S8sE8OWczn05e4hlRMMbCy1ncljP2/IcjcRrI1Jr0HJVMsCBvoM+Oec4Z2gEeFCy43Rr3oLy8yUK1tuM0HV6pnyhzhw07WnNx2+BBxGfrCIBZbm8F9xPkLSOoRE0HGPukajxqhX958/b8Ou1FSt8DWD0oARiou4SQm7rlnWVs3jZl9cGRy9bH5U0IpZAFrdQOnOfXnK1Y3Yh9BtMgxozbKCTTePVRzg5tJwU4gkmEjItFxDxTWKYHDzX6h9iUiEL1oTq6ZuYL7EdM39Sz41whfaADAlUlphHDhsHXvxr2MH5btNjXPsWzB1kE1RarSosG82Xq4BuaZ7QQ== thangap.aws01@gmail.com"
}

variable "aws-eks-private-key-algorithm" {
  type    = string
  default = "RSA"
}

variable "aws-eks-private-key-rsa-bits" {
  description = "When algorithm is `RSA`, the size of the generated RSA key, in bits (default: `4096`)"
  type        = number
  default     = 4096
}

variable "aws-iam-role-name" {
  type    = string
  default = ""
}

variable "aws-iam-role-description" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "aws-kms-alias-name" {
  type    = string
  default = ""
}

variable "aws-kms-key-description" {
  type    = string
  default = ""
}

variable "aws-eks-cluster-enabled-cluster-log-types" {
  type    = list(any)
  default = []
}

variable "aws-eks-cluster-name" {
  type    = string
  default = ""
}

variable "aws-eks-cluster-version" {
  type    = string
  default = ""
}

variable "aws-eks-cluster-kms-resources-encryption" {
  type    = list
  default = []
}

variable "aws-eks-iam-node-role" {
  type    = string
  default = ""
}

variable "aws-eks-iam-node-role-description" {
  type    = string
  default = ""
}

variable "aws-eks-iam-ebs-csi-controller-role" {
  type    = string
  default = ""
}

variable "aws-eks-iam-ebs-csi-controller-description" {
  type    = string
  default = ""
}

variable "aws-iam-role-policy-eks-ebs-csi-driver-policy-name" {
  type    = string
  default = ""
}

variable "aws-iam-role-policy-ClusterAutoscalerPolicy-name" {
  type    = string
  default = ""
}

variable "aws-eks-vpc-name" {
  type    = string
  default = ""
}

variable "aws-eks-vpc-cidr" {
  type  = string
  default = "0.0.0.0/0"
}

variable "aws-eks-vpc-azs" {
  type    = list(any)
  default = []
}

variable "aws-eks-vpc-private-subnets" {
  type    = list(any)
  default = []
}

variable "aws-eks-vpc-private-subnet-names" {
  type    =  list(string)
  default = []
}

variable "aws-eks-vpc-public-subnets" {
  type    = list(any)
  default = []
}

variable "aws-eks-vpc-public-subnet-names" {
  type    = list(string)
  default = []
}

variable "aws-eks-node-group-node-group-name" {
  type    = string
  default = ""
}

variable "aws-eks-node-group-labels" {
  type    = map(any)
  default = {}
}

variable "aws-eks-node-group-instance-types" {
  type    = list(any)
  default = ["t3.large"]
}

variable "aws-eks-node-sg-name" {
  type    = string
  default = ""
}

variable "aws-eks-node-sg-description" {
  type    = string
  default = ""
}

variable "aws-eks-node-group-disk-size" {
  type    = string
  default = "200"
}

variable "aws-eks-node-group-version" {
  type    = string
  default = ""
}

variable "aws-eks-node-group-desired_size" {
  type    = string
  default = "2"
}

variable "aws-eks-node-group-max-size" {
  type    = string
  default = "4"
}

variable "aws-eks-node-group-min-size" {
  type    = string
  default = "2"
}

variable "aws-eks-cluster-sg-name" {
  type    = string
  default = ""
}

variable "aws-eks-cluster-sg-description" {
  type    = string
  default = ""
}

variable "aws-eks-node-bastion-name" {
  type = string
  default = ""
}

variable "aws-eks-node-bastion-image-id" {
  type = string
  default = ""
}

variable "aws-eks-node-bastion-instance-type" {
  type = string
  default = "t2.micro"
}

variable "aws-eks-node-bastion-configuration-key-name" {
  type = string
  default = ""
}

variable "aws-eks-node-bastion-user-data" {
  type = string
  default = ""
}

variable "aws-eks-node-bastion-volume-type" {
  type = string
  default = "gp2"
}

variable "aws-eks-node-bastion-volume-size" {
  type = string
  default = "50"
}

variable "aws-eks-node-bastion-desired_capacity" {
  type = string
  default = "1"
}

variable "aws-eks-node-bastion-group-max-size" {
  type = string
  default = "2"
}

variable "aws-eks-node-bastion-group-min-size" {
  type = string
  default = "1"
}

variable "aws-eks-node-bastion-sg-name" {
  type = string
  default = ""
}

variable "aws-eks-node-bastion-sg-description" {
  type = string
  default = ""
}

variable "aws-eks-iam-elb-role" {
  type  = string
  default = ""
}

variable "aws-eks-iam-elb-role-description" {
  type  = string
  default = ""
}

variable "aws-iam-role-policy-eks-elb-policy-name" {
  type = string
  default = ""
}

variable "values_file" {
  description = "The name of the ArgoCD helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "elb-sa-name" {
  type = string
  default = "aws-load-balancer-controller"
}