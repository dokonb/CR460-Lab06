resource "google_compute_network" "cr460-158000" {
  name                    = "cr460-158000"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "east1-dokonb-public" {
  name          = "east1-dokonb-public"
  ip_cidr_range = "192.168.1.0/24"
  network       = "${google_compute_network.cr460-158000.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "east1-dokonb-workload" {
  name          = "east1-dokonb-workload"
  ip_cidr_range = "172.16.1.0/24"
  network       = "${google_compute_network.cr460-158000.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "east1-dokonb-backend" {
  name          = "east1-dokonb-backend"
  ip_cidr_range = "10.0.2.0/24"
  network       = "${google_compute_network.cr460-158000.self_link}"
  region        = "us-east1"
}
