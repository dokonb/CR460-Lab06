resource "google_compute_instance" "jump.dokonb.cr460lab.com" {
  name         = "jump.dokonb.cr460lab.com"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "debian-8-jessie-v20170227"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-dokonb-public.name}"
    access_config {
    }
  }
}
resource "google_compute_instance" "vault.dokonb.cr460lab.com" {
  name         = "vault.dokonb.cr460lab.com"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-dokonb-public.name}"
    access_config {
    }
  }
}
