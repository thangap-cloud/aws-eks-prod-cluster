##################
#Common
##################
tags                                = {Env="Prod",CreatedBy="TF",App="MyApp" }
aws-eks-private-key-name            = "aws-eks-bastion-key"

##################
#aws-eks-iam-role
##################
aws-iam-role-name                   = "aws-eks-iam-role-prod-app"
aws-iam-role-description            = "role created for aks prod cluster management"

######################
#aws-eks-iam-node-role
######################
aws-eks-iam-node-role               = "aws-eks-iam-node-role-prod-app"
aws-eks-iam-node-role-description   = "role created for aks prod cluster node management"

###################################
#aws-eks-iam-ebs-csi-controller-role
###################################
aws-eks-iam-ebs-csi-controller-role         = "aws-eks-iam-ebs-csi-role-prod-app"
aws-eks-iam-ebs-csi-controller-description  = "role created for managing ebs csi controller for eks"

############################################
#aws-iam-role-policy-ClusterAutoscalerPolicy
############################################
aws-iam-role-policy-ClusterAutoscalerPolicy-name  = "aws-eks-cluster-autoscaler-policy-prod-app"

##############################################
#aws-iam-role-policy-eks-ebs-csi-driver-policy
##############################################
aws-iam-role-policy-eks-ebs-csi-driver-policy-name  = "aws-eks-cluster-csi-policy-prod-app"

#####################
#aws-eks-elb
#####################
aws-eks-iam-elb-role                    = "aws-eks-lb-controller-role-prod-app"
aws-eks-iam-elb-role-description        = "role to manage elb for eks"
aws-iam-role-policy-eks-elb-policy-name = "aws-eks-cluster-elb-policy-prod-app"

############
#aws-kms-key
############
aws-kms-alias-name      = "alias/aws-kms-key-alias-prod-app"
aws-kms-key-description = "kms key created for prod app "

############
#aws-eks-vpc
############
aws-eks-vpc-name                =  "aws-eks-vpc-prod-app"
aws-eks-vpc-cidr                =  "10.0.0.0/16"
aws-eks-vpc-azs                 = ["us-east-1a","us-east-1b","us-east-1c"]
aws-eks-vpc-private-subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
aws-eks-vpc-public-subnets      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
aws-eks-vpc-private-subnet-names= ["priv-subnet-a","priv-subnet-b","priv-subnet-c"]
aws-eks-vpc-public-subnet-names = ["pub-subnet-a","pub-subnet-b","pub-subnet-c"]

###################
#aws-eks-cluster-sg
###################
aws-eks-cluster-sg-name         = "aws-eks-cluster-sg-prod-app"
aws-eks-cluster-sg-description  = "security group created for managing eks cluster"

################
#aws-eks-node-sg
################
aws-eks-node-sg-name                = "aws-eks-node-sg-prod-app"
aws-eks-node-sg-description         = "security group created for managing eks nodes"

########################
#aws-eks-node-bastion-sg
########################
aws-eks-node-bastion-sg-name        = "aws-eks-jumphost-sg-prod-app"
aws-eks-node-bastion-sg-description = "security group created for managing jump host"

#####################
#aws-eks-node-bastion
#####################
aws-eks-node-bastion-name                     = "aws-eks-jumphost"
aws-eks-node-bastion-image-id                 = "ami-0dfcb1ef8550277af"
aws-eks-node-bastion-instance-type            = "t2.micro"
aws-eks-node-bastion-configuration-key-name   = "key-pair-name"
aws-eks-node-bastion-user-data                = <<USERDATA
    #!/usr/bin/env bash
    init_func(){
        curl -o ~/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
        curl -o ~/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl
        curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh
        chmod +x ~/aws-iam-authenticator
        chmod +x ~/kubectl

    }
    export -f init_func
    /bin/su ec2-user -c 'init_func'
    mv /home/ec2-user/kubectl /usr/local/bin
    mv /home/ec2-user/aws-iam-authenticator /usr/local/bin
    USERDATA

################
#aws-eks-cluster
################
aws-eks-cluster-name                        = "aws-eks-cluster-prod-app"
aws-eks-cluster-version                     = "1.24"
aws-eks-cluster-enabled-cluster-log-types   = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
aws-eks-cluster-kms-resources-encryption    = ["secrets"]
aws-eks-node-group-node-group-name          = "aws-eks-node-prod-app"
aws-eks-node-group-labels                   = {name="eks-nodes",app="prod-app",env="prod"}
aws-eks-node-group-instance-types           = ["t3.large"]
aws-eks-node-group-desired_size             = "2"
aws-eks-node-group-max-size                 = "2"
aws-eks-node-group-min-size                 = "1"









