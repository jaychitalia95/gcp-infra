terraform {
  backend "gcs" {
    bucket  = "tfstate-max"
    prefix  = "terraform/state/gcs"
  }
}