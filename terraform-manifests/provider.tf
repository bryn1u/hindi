 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.93.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
  backend "azurerm" {
    # do wszystkich zasobow ponizej bedziemy uzywali azuredevop dlatego jest disablw
    # resource_group_name  = "bryn1u"
    # storage_account_name = "sabryn1u"
    # container_name       = "tfstatefiles"
    # key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

#Updated Provider Block with prevent_deletion_if_contains_resources = false
#When creating AKS Cluster, ContainerInsights resource gets auto-created by default
#and during the resource deletion process terraform destroy it will timeout and throw an error that Terraform didn't find resource ContainerInsights.
#So with the below fix, our terraform destroy will be successful


