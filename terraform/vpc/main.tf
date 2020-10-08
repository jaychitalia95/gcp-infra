provider "google" {
    project = var.project
    region = var.location
    zone = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "max-vpc"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "secondary-ip-ranges" {
  name          = "max-subnetwork"
  ip_cidr_range = "10.0.0.0/28"
  region        = var.location
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "max-pods-range"
    ip_cidr_range = "10.1.0.0/22"
  }
  secondary_ip_range {
    range_name    = "max-services-range"
    ip_cidr_range = "10.2.0.0/26"
  }
}

resource "google_compute_firewall" "allow-internal" {
    name = "max-firewall-internal"
    network = google_compute_network.vpc_network.id

    source_ranges = ["10.0.0.0/28"]
    allow {
        protocol = "all"
    }

}

resource "google_compute_firewall" "allow-icmp" {
    name = "max-firewall-icmp"
    network = google_compute_network.vpc_network.id

    allow{
        protocol = "icmp"
    }
}

resource "google_compute_firewall" "allow-rdp" {
    name = "max-firewall-rdp"
    network = google_compute_network.vpc_network.id

    allow {
        protocol = "tcp"
        ports = ["3389"]
    }

}

resource "google_compute_firewall" "allow-ssh" {
    name = "max-firewall-ssh"
    network = google_compute_network.vpc_network.id

    allow {
        protocol = "tcp"
        ports = ["22"]
    }

}