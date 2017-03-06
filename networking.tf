resource "google_compute_firewall" "dokonb-fw-public" {
  name    = "dokonb-fw-public"
  network = "${google_compute_network.east1-dokonb-public.name}"
  allow {
    protocol = "tcp"
    ports    = ["80,443,22"]
  }
}

resource "google_compute_firewall" "dokonb-fw-work" {
  name    = "dokonb-fw-work"
  network = "${google_compute_network.east1-dokonb-workload.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
      source_ranges = ["192.168.1.0/24"]
}

resource "google_compute_firewall" "dokonb-fw-backend-side1" {
  name    = "dokonb-fw-backend-side1"
  network = "${google_compute_network.east1-dokonb-backend.name}"
  allow {
    protocol = "tcp"
    ports    = ["22,2379,2380"]
  }

      source_ranges = ["192.168.1.0/24"]
}

resource "google_compute_firewall" "dokonb-fw-backend-side2" {
  name    = "dokonb-fw-backend-side2"
  network = "${google_compute_network.east1-dokonb-backend.name}"
  allow {
    protocol = "tcp"
    ports    = ["22,2379,2380"]
  }

      source_ranges = ["172.16.1.0/24"]
}
