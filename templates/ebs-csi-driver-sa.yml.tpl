---
controller:
  region: ${aws_region}
  k8sTagClusterId: ${cluster_name}
  serviceAccount:
    create: true
    name: ${ebs_csi_sa_name}
    annotations:
      eks.amazonaws.com/role-arn: ${iam_role_arn}