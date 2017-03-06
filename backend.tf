resource "google_compute_instance" "dokonb-etcd1" {
  name         = "dokonb-etcd1"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-dokonb-backend.name}"
    access_config {
    }
  }
}
resource "google_compute_instance" "dokonb-etcd2" {
  name         = "dokonb-etcd2"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-dokonb-backend.name}"
    access_config {
    }
  }
}
resource "google_compute_instance" "dokonb-etcd3" {
  name         = "dokonb-etcd3"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-dokonb-backend.name}"
    access_config {

    }
  }
}
