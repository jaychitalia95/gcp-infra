resource "google_storage_bucket" "tfstate-max" {
    default_event_based_hold    = false
    force_destroy               = false
    labels                      = {}
    location                    = var.location
    name                        = var.bucket_name
    project                     = var.project
    requester_pays              = false
    storage_class               = "STANDARD"
    uniform_bucket_level_access = false
}
