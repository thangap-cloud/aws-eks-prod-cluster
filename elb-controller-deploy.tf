resource "helm_release" "aws-load-balancer-controller" {
  namespace        = "kube-system"
  create_namespace = false
  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"

  set {
    name  = "clusterName"
    value =  "${var.aws-eks-cluster-name}"
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "${var.elb-sa-name}"
  }
}


