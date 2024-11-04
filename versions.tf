terraform {
  required_version = ">= 1.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.81.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.12.1"
    }
  }
}