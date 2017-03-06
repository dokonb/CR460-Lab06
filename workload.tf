resource "google_compute_instance" "dokonb-master" {
 name         = "dokonb-master"
 machine_type = "f1-micro"
 zone         = "us-east1-b"

 disk {
   image = "coreos-cloud/coreos-stable"
 }

 network_interface {
   subnetwork = "${google_compute_subnetwork.east1-dokonb-workload.name}"
   access_config {

   }
 }
}

resource "google_compute_instance_template" "dokonb-worker" {
 name         = "dokonb-worker"
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

resource "google_compute_instance_group_manager" "dokonb-grp-mgr" {
 name        = "dokonb-grp-mgr"

 base_instance_name = "dokonb-worker"
 instance_template  = "${google_compute_instance_template.dokonb-worker.self_link}"
 zone               = "us-east1-b"

}

resource "google_compute_autoscaler" "dokonb-autoscaler" {
 name   = "dokonb-autoscaler"
 zone   = "us-east1-b"
 target = "${google_compute_instance_group_manager.dokonb-grp-mgr.self_link}"

 autoscaling_policy = {
   max_replicas    = 5
   min_replicas    = 2
   cooldown_period = 60

   cpu_utilization {
     target = 0.5
   }
 }
}
