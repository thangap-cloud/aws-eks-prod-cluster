provider "kubernetes"{
host                   = data.aws_eks_cluster.cluster.endpoint
token                  = data.aws_eks_cluster_auth.cluster.token
cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
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

