resource "google_compute_instance" "master" {
  name         = "master"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {image = "coreos-cloud/coreos-stable"}
 network_interface {
   subnetwork = "${google_compute_subnetwork.east1-dokonb-workload.name}"
   access_config {
   }
 }
}

resource "google_compute_instance_template" "workers" {
 name         = "dokonb-workers"
 description  = "template description"
 machine_type = "f1-micro"
 can_ip_forward = false

 disk {
   source_image = "coreos-cloud/coreos-stable"
   auto_delete = true
   boot = true
 }
 network_interface {
   subnetwork = "${google_compute_subnetwork.east1-dokonb-workload.name}"
 }
}

resource "google_compute_instance_group_manager" "grpmgr" {
 name        = "dokonb-workers"
 description = "Terraform test instance group manager"
 instance_template  = "${google_compute_instance_template.workers.self_link}"
 base_instance_name = "grpmgr"
 update_strategy    = "NONE"
 zone               = "us-east1-b"
 target_size  = 2
  named_port {
    name = "tcp"
    port = 22
  }

}
resource "google_compute_autoscaler" "autoscaler" {
 name   = "dokonb-autoscaler"
 zone   = "us-east1-b"
 target = "${google_compute_instance_group_manager.grpmgr.self_link}"

 autoscaling_policy = {
   max_replicas    = 5
   min_replicas    = 2
   cooldown_period = 60

   cpu_utilization {
     target = 0.5
   }
 }
}
