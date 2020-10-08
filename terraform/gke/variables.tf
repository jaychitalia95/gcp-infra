variable "cluster_name" {
    default = "max"
}

variable "location" {
    default = "us-east1"
}

variable "zone" {
    default = "us-east1-c"
}

variable "project" {
    default = "gke-base-291019"
}

variable "initial_node_count" {
    default = 1
}

variable "machine_type" {
    default = "g1-small"
}
