resource "google_compute_firewall" "public" {
  name    = "public"
  network = "${google_compute_network.cr460-158000.name}"
  allow {
    protocol = "tcp"
    ports    = ["80","443","22"]
  }
  source_ranges = ["192.168.1.0/24"]
}

resource "google_compute_firewall" "workload" {
  name    = "workload"
  network = "${google_compute_network.cr460-158000.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
      source_ranges = ["192.168.1.0/24"]
}

resource "google_compute_firewall" "backend" {
  name    = "backend"
  network = "${google_compute_network.cr460-158000.name}"
  allow {
    protocol = "tcp"
    ports    = ["22","2379","2380"]
  }

      source_ranges = ["192.168.1.0/24"]
}

resource "google_compute_firewall" "backend2" {
  name    = "backend2"
  network = "${google_compute_network.cr460-158000.name}"
  allow {
    protocol = "tcp"
    ports    = ["22","2379","2380"]
  }

      source_ranges = ["172.16.1.0/24"]
}
