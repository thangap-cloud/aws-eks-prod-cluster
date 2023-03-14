############################
# ELB Service Account
############################

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