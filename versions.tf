terraform {
  required_version = "~> 1.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.21"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
}
