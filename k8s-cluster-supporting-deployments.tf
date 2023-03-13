provider "kubernetes"{
host                   = data.aws_eks_cluster.cluster.endpoint
token                  = data.aws_eks_cluster_auth.cluster.token
cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  load_config_file       = false
}


resource "kubectl_manifest" "eks-elb-addon" {
  yaml_body = <<YAML

apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/name: aws-load-balancer-controller
  name: aws-load-balancer-controller
  namespace: kube-system
  annotations:
    eks.amazonaws.com/role-arn: ${module.aws-eks-iam-elb-role.role-name-arn}

YAML
}
#provider "helm" {
#
#  # Deploy Loki Monitoring stack
#  # Deploy nginx ingress controller
#  # Deploy ArgoCD
#  # Deploy velero - for eks etcd backup
#  # Deploy CSI Secrets provider class - for secret management
#  # Deploy Letsencrypt - for ingress certificate management
#}

