resource "helm_release" "ebs-csi-driver" {
  chart            = "aws-ebs-csi-driver"
  name             = "aws-ebs-csi-driver"
  repository       = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  namespace        = "kube-system"
  create_namespace = false


  values = [
    templatefile("${path.module}/templates/ebs-csi-driver-sa.yml.tpl", {
      aws_region        = data.aws_region.current.name
      cluster_name      = var.aws-eks-cluster-name
      ebs_csi_sa_name   = var.ebs-csi-sa-name
      iam_role_arn      = module.aws-eks-iam-ebs-csi-controller-role.role-name-arn
    })
  ]
}