# aws-eks-prod
Setting up a prod grade eks cluster is always a challenging task, there are few items which are must and required when creating a prod grade EKS cluster

This Terraform Blueprint created based on my working experience with multiple clients

All the modules are currently private repos, which are tailored for prod requirements, these modules are highly customizable. Get in touch with me for a demo.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.21.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.2.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-eks-cluster"></a> [aws-eks-cluster](#module\_aws-eks-cluster) | git::git@github.com:thangap-cloud/aws-module-eks.git | n/a |
| <a name="module_aws-eks-iam-ebs-csi-controller-role"></a> [aws-eks-iam-ebs-csi-controller-role](#module\_aws-eks-iam-ebs-csi-controller-role) | git::git@github.com:thangap-cloud/aws-module-iam-role.git | n/a |
| <a name="module_aws-eks-iam-elb-role"></a> [aws-eks-iam-elb-role](#module\_aws-eks-iam-elb-role) | git::git@github.com:thangap-cloud/aws-module-iam-role.git | n/a |
| <a name="module_aws-eks-iam-node-role"></a> [aws-eks-iam-node-role](#module\_aws-eks-iam-node-role) | git::git@github.com:thangap-cloud/aws-module-iam-role.git | n/a |
| <a name="module_aws-eks-iam-role"></a> [aws-eks-iam-role](#module\_aws-eks-iam-role) | git::git@github.com:thangap-cloud/aws-module-iam-role.git | n/a |
| <a name="module_aws-eks-node-bastion"></a> [aws-eks-node-bastion](#module\_aws-eks-node-bastion) | git::git@github.com:thangap-cloud/aws-module-bastion.git | n/a |
| <a name="module_aws-eks-private-key"></a> [aws-eks-private-key](#module\_aws-eks-private-key) | git::git@github.com:thangap-cloud/aws-module-key-pair.git | n/a |
| <a name="module_aws-eks-vpc"></a> [aws-eks-vpc](#module\_aws-eks-vpc) | git::git@github.com:thangap-cloud/aws-module-vpc.git | n/a |
| <a name="module_aws-iam-role-policy-ClusterAutoscalerPolicy"></a> [aws-iam-role-policy-ClusterAutoscalerPolicy](#module\_aws-iam-role-policy-ClusterAutoscalerPolicy) | git::git@github.com:thangap-cloud/aws-module-iam-role-policy.git | n/a |
| <a name="module_aws-iam-role-policy-eks-ebs-csi-driver-policy"></a> [aws-iam-role-policy-eks-ebs-csi-driver-policy](#module\_aws-iam-role-policy-eks-ebs-csi-driver-policy) | git::git@github.com:thangap-cloud/aws-module-iam-role-policy.git | n/a |
| <a name="module_aws-iam-role-policy-eks-elb-policy"></a> [aws-iam-role-policy-eks-elb-policy](#module\_aws-iam-role-policy-eks-elb-policy) | git::git@github.com:thangap-cloud/aws-module-iam-role-policy.git | n/a |
| <a name="module_aws-kms-key"></a> [aws-kms-key](#module\_aws-kms-key) | git::git@github.com:thangap-cloud/aws-module-kms.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.openid](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_security_group.eks_bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.aws-load-balancer-controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ebs-csi-driver](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx-ingress-controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_ami.amazon-linux-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_eks_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [tls_certificate.cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-eks-cluster-enabled-cluster-log-types"></a> [aws-eks-cluster-enabled-cluster-log-types](#input\_aws-eks-cluster-enabled-cluster-log-types) | kubernetes cluster logs to be enabled | `list(any)` | <pre>[<br>  "api",<br>  "audit",<br>  "authenticator"<br>]</pre> | no |
| <a name="input_aws-eks-cluster-kms-resources-encryption"></a> [aws-eks-cluster-kms-resources-encryption](#input\_aws-eks-cluster-kms-resources-encryption) | list of k8s resources to be encrypted by kms | `list` | <pre>[<br>  "secrets"<br>]</pre> | no |
| <a name="input_aws-eks-cluster-name"></a> [aws-eks-cluster-name](#input\_aws-eks-cluster-name) | name of the eks cluster to be created | `string` | `"aws-eks-app"` | no |
| <a name="input_aws-eks-cluster-sg-description"></a> [aws-eks-cluster-sg-description](#input\_aws-eks-cluster-sg-description) | eks cluster group security group description | `string` | `"aws eks sg"` | no |
| <a name="input_aws-eks-cluster-sg-name"></a> [aws-eks-cluster-sg-name](#input\_aws-eks-cluster-sg-name) | eks cluster sg name | `string` | `"aws-eks-cluster-sg"` | no |
| <a name="input_aws-eks-cluster-version"></a> [aws-eks-cluster-version](#input\_aws-eks-cluster-version) | k8s version to be created | `string` | `"1.24"` | no |
| <a name="input_aws-eks-iam-ebs-csi-controller-description"></a> [aws-eks-iam-ebs-csi-controller-description](#input\_aws-eks-iam-ebs-csi-controller-description) | aws eks csi controller role description | `string` | `"aws eks csi controller"` | no |
| <a name="input_aws-eks-iam-ebs-csi-controller-role"></a> [aws-eks-iam-ebs-csi-controller-role](#input\_aws-eks-iam-ebs-csi-controller-role) | aws eks csi controller role | `string` | `"aws-eks-iam-ebs-csi-role-app"` | no |
| <a name="input_aws-eks-iam-elb-role"></a> [aws-eks-iam-elb-role](#input\_aws-eks-iam-elb-role) | aws eks elb iam role name | `string` | `"aws-eks-iam-elb-role"` | no |
| <a name="input_aws-eks-iam-elb-role-description"></a> [aws-eks-iam-elb-role-description](#input\_aws-eks-iam-elb-role-description) | aws eks elb iam role description | `string` | `"aws eks elb iam role"` | no |
| <a name="input_aws-eks-iam-node-role"></a> [aws-eks-iam-node-role](#input\_aws-eks-iam-node-role) | aws eks node creation role name | `string` | `"aws-eks-node-role"` | no |
| <a name="input_aws-eks-iam-node-role-description"></a> [aws-eks-iam-node-role-description](#input\_aws-eks-iam-node-role-description) | aws eks node role | `string` | `"aws eks node"` | no |
| <a name="input_aws-eks-node-bastion-configuration-key-name"></a> [aws-eks-node-bastion-configuration-key-name](#input\_aws-eks-node-bastion-configuration-key-name) | jump host  key pair | `string` | `"key-pair-name"` | no |
| <a name="input_aws-eks-node-bastion-desired_capacity"></a> [aws-eks-node-bastion-desired\_capacity](#input\_aws-eks-node-bastion-desired\_capacity) | jump host desired size | `string` | `"1"` | no |
| <a name="input_aws-eks-node-bastion-group-max-size"></a> [aws-eks-node-bastion-group-max-size](#input\_aws-eks-node-bastion-group-max-size) | jump host maximum size | `string` | `"2"` | no |
| <a name="input_aws-eks-node-bastion-group-min-size"></a> [aws-eks-node-bastion-group-min-size](#input\_aws-eks-node-bastion-group-min-size) | jump host minimum size | `string` | `"1"` | no |
| <a name="input_aws-eks-node-bastion-instance-type"></a> [aws-eks-node-bastion-instance-type](#input\_aws-eks-node-bastion-instance-type) | jump host instance type | `string` | `"t2.micro"` | no |
| <a name="input_aws-eks-node-bastion-name"></a> [aws-eks-node-bastion-name](#input\_aws-eks-node-bastion-name) | jump host name to access eks nodes | `string` | `"aws-eks-node-bastion"` | no |
| <a name="input_aws-eks-node-bastion-sg-description"></a> [aws-eks-node-bastion-sg-description](#input\_aws-eks-node-bastion-sg-description) | jump host sg name description | `string` | `"jump host sg"` | no |
| <a name="input_aws-eks-node-bastion-sg-name"></a> [aws-eks-node-bastion-sg-name](#input\_aws-eks-node-bastion-sg-name) | jump host sg name | `string` | `"aws-eks-node-bastion-sg"` | no |
| <a name="input_aws-eks-node-bastion-user-data"></a> [aws-eks-node-bastion-user-data](#input\_aws-eks-node-bastion-user-data) | init scripts for jump host | `string` | `""` | no |
| <a name="input_aws-eks-node-bastion-volume-size"></a> [aws-eks-node-bastion-volume-size](#input\_aws-eks-node-bastion-volume-size) | jump host voume size | `string` | `"50"` | no |
| <a name="input_aws-eks-node-bastion-volume-type"></a> [aws-eks-node-bastion-volume-type](#input\_aws-eks-node-bastion-volume-type) | jump host volume type | `string` | `"gp2"` | no |
| <a name="input_aws-eks-node-group-desired_size"></a> [aws-eks-node-group-desired\_size](#input\_aws-eks-node-group-desired\_size) | eks asg node desired size | `string` | `"2"` | no |
| <a name="input_aws-eks-node-group-disk-size"></a> [aws-eks-node-group-disk-size](#input\_aws-eks-node-group-disk-size) | eks node disk size | `string` | `"200"` | no |
| <a name="input_aws-eks-node-group-instance-types"></a> [aws-eks-node-group-instance-types](#input\_aws-eks-node-group-instance-types) | eks node group instance types | `list(any)` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_aws-eks-node-group-labels"></a> [aws-eks-node-group-labels](#input\_aws-eks-node-group-labels) | eks node group labels | `map(any)` | `{}` | no |
| <a name="input_aws-eks-node-group-max-size"></a> [aws-eks-node-group-max-size](#input\_aws-eks-node-group-max-size) | eks asg node maximum size | `string` | `"4"` | no |
| <a name="input_aws-eks-node-group-min-size"></a> [aws-eks-node-group-min-size](#input\_aws-eks-node-group-min-size) | eks asg node minimum size | `string` | `"2"` | no |
| <a name="input_aws-eks-node-group-node-group-name"></a> [aws-eks-node-group-node-group-name](#input\_aws-eks-node-group-node-group-name) | eks node group name | `string` | `"aws-eks-node-group-app"` | no |
| <a name="input_aws-eks-node-group-version"></a> [aws-eks-node-group-version](#input\_aws-eks-node-group-version) | eks node group k8s version | `string` | `"1,24"` | no |
| <a name="input_aws-eks-node-sg-description"></a> [aws-eks-node-sg-description](#input\_aws-eks-node-sg-description) | eks node group security group description | `string` | `"aws eks node group"` | no |
| <a name="input_aws-eks-node-sg-name"></a> [aws-eks-node-sg-name](#input\_aws-eks-node-sg-name) | eks node group security group name | `string` | `"aws-eks-node-sg"` | no |
| <a name="input_aws-eks-private-key-algorithm"></a> [aws-eks-private-key-algorithm](#input\_aws-eks-private-key-algorithm) | private key algorithm to be used | `string` | `"RSA"` | no |
| <a name="input_aws-eks-private-key-name"></a> [aws-eks-private-key-name](#input\_aws-eks-private-key-name) | private key name for to log in to eks worker nodes | `string` | `"aws-eks-private-key"` | no |
| <a name="input_aws-eks-private-key-public-key"></a> [aws-eks-private-key-public-key](#input\_aws-eks-private-key-public-key) | users public key | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUSmojsuTFBfWIyjEd+fKR2QUx2W+JrT0RXFudZAknPHpvm/vokGBeldkE2lp/aad01qeOOglHfJQDd5LSIdXOHTkyx+ZaDVeofAsEPm5JNr3rWQz3e32Br5tYwZBcecWvdss2Zx9Hzhx5pq/K0JfOC8GsevBa4MsdbDu/2S8neVtSaf88UjgOqUkM5aaO4D1hatZH7UCtmD41PGiStk60mf9pt0YU4tTynga+fMqpSVyC6R39ag41GIapZgKHsVaPwVH5cS8remKu2W8g42ZtiRhYb8kMkPzVwJM2RdHVjYG+31fUyRHSCchHfTF8NjBRhTg5I/fH/Ymkoj5P4sPIJCL6UtXV5S8sE8OWczn05e4hlRMMbCy1ncljP2/IcjcRrI1Jr0HJVMsCBvoM+Oec4Z2gEeFCy43Rr3oLy8yUK1tuM0HV6pnyhzhw07WnNx2+BBxGfrCIBZbm8F9xPkLSOoRE0HGPukajxqhX958/b8Ou1FSt8DWD0oARiou4SQm7rlnWVs3jZl9cGRy9bH5U0IpZAFrdQOnOfXnK1Y3Yh9BtMgxozbKCTTePVRzg5tJwU4gkmEjItFxDxTWKYHDzX6h9iUiEL1oTq6ZuYL7EdM39Sz41whfaADAlUlphHDhsHXvxr2MH5btNjXPsWzB1kE1RarSosG82Xq4BuaZ7QQ== thangap.aws01@gmail.com"` | no |
| <a name="input_aws-eks-private-key-rsa-bits"></a> [aws-eks-private-key-rsa-bits](#input\_aws-eks-private-key-rsa-bits) | When algorithm is `RSA`, the size of the generated RSA key, in bits (default: `4096`) | `number` | `4096` | no |
| <a name="input_aws-eks-vpc-azs"></a> [aws-eks-vpc-azs](#input\_aws-eks-vpc-azs) | custom vpc az's | `list(any)` | `[]` | no |
| <a name="input_aws-eks-vpc-cidr"></a> [aws-eks-vpc-cidr](#input\_aws-eks-vpc-cidr) | custom vpc cidr range | `string` | `"10.0.0.0/16"` | no |
| <a name="input_aws-eks-vpc-name"></a> [aws-eks-vpc-name](#input\_aws-eks-vpc-name) | custom vpc name | `string` | `"aws-eks-vpc"` | no |
| <a name="input_aws-eks-vpc-private-subnet-names"></a> [aws-eks-vpc-private-subnet-names](#input\_aws-eks-vpc-private-subnet-names) | custom vpc public subnet names | `list(string)` | `[]` | no |
| <a name="input_aws-eks-vpc-private-subnets"></a> [aws-eks-vpc-private-subnets](#input\_aws-eks-vpc-private-subnets) | custom vpc private subnet cidr | `list(any)` | `[]` | no |
| <a name="input_aws-eks-vpc-public-subnet-names"></a> [aws-eks-vpc-public-subnet-names](#input\_aws-eks-vpc-public-subnet-names) | custom vpc public subnet names | `list(string)` | `[]` | no |
| <a name="input_aws-eks-vpc-public-subnets"></a> [aws-eks-vpc-public-subnets](#input\_aws-eks-vpc-public-subnets) | custom vpc public subnet cidr | `list(any)` | `[]` | no |
| <a name="input_aws-iam-role-description"></a> [aws-iam-role-description](#input\_aws-iam-role-description) | aws eks cluster iam role description | `string` | `"aws eks i am role"` | no |
| <a name="input_aws-iam-role-name"></a> [aws-iam-role-name](#input\_aws-iam-role-name) | aws eks cluster iam role | `string` | `"aws-eks-iam-role"` | no |
| <a name="input_aws-iam-role-policy-ClusterAutoscalerPolicy-name"></a> [aws-iam-role-policy-ClusterAutoscalerPolicy-name](#input\_aws-iam-role-policy-ClusterAutoscalerPolicy-name) | cluster autoscaler policy name | `string` | `"aws-iam-role-policy-ClusterAutoscalerPolicy"` | no |
| <a name="input_aws-iam-role-policy-eks-ebs-csi-driver-policy-name"></a> [aws-iam-role-policy-eks-ebs-csi-driver-policy-name](#input\_aws-iam-role-policy-eks-ebs-csi-driver-policy-name) | aws eks ebs csi driver policy name | `string` | `"aws-iam-role-policy-eks-ebs-csi-driver-policy"` | no |
| <a name="input_aws-iam-role-policy-eks-elb-policy-name"></a> [aws-iam-role-policy-eks-elb-policy-name](#input\_aws-iam-role-policy-eks-elb-policy-name) | aws eks elb iam role policy name | `string` | `"aws-iam-role-policy-eks-elb-policy"` | no |
| <a name="input_aws-kms-alias-name"></a> [aws-kms-alias-name](#input\_aws-kms-alias-name) | aws kms key alias name | `string` | `"alias/aws-kms-key-alias-app"` | no |
| <a name="input_aws-kms-key-description"></a> [aws-kms-key-description](#input\_aws-kms-key-description) | aws kms key description | `string` | `"aws kms key"` | no |
| <a name="input_ebs-csi-sa-name"></a> [ebs-csi-sa-name](#input\_ebs-csi-sa-name) | ws ebs csi driver service account name | `string` | `"ebs-csi-controller-sa"` | no |
| <a name="input_elb-sa-name"></a> [elb-sa-name](#input\_elb-sa-name) | aws elb service account name used by cluster | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be applied to the resources | `map(any)` | `{}` | no |
| <a name="input_values_file"></a> [values\_file](#input\_values\_file) | The name of the ArgoCD helm chart values file to use | `string` | `"values.yaml"` | no |

## Outputs

No outputs.
