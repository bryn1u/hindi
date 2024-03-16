
variable "location" {
  default = "West Europe"
  type    = string
}

variable "resource_group_name" {
  default = "terraform-aks"
  type    = string
}

variable "resource_groups" {
  type = map(object({
    location = string
    tags     = map(string)
  }))

  default = {
    "rg1" = {
      location = "West Europe"
      tags = {
        "deploy" = "terraform"
      }
    },
    "rg2" = {
      location = "West Europe"
      tags = {
        "deploy" = "terraform"
      }
    }
    "terraform-storage-rg" = {
      location = "West Europe"
      tags = {
        "deploy" = "terraform"
      }
    }
  }
}

variable "environment" {
  # azuredevops variables
#  default = "dev"
  type    = string
}

variable "ssh_public_key" {
  # uzywamy do uwierzytelnienia azuredevops dlatego jest disable
  # default     = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type        = string
  default     = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type        = string
  default     = "P@ssw0rd1234mabyc14znakow"
  description = "This variable defines the Windows admin password k8s Worker nodes"
}