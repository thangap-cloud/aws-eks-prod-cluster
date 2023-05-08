terraform {
  required_version = "~> 1.4.6"

  required_providers {
    aws = {
      source    = "hashicorp/aws"
      version   = ">=4.21.0"
    }

    kubernetes  = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }

    helm        = {
      source    = "hashicorp/helm"
      version   = "~> 2.2.0"
    }

    tls         = {
      source    = "hashicorp/tls"
      version   = "~> 3.4.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }
}