output "raddit_static_ip" {
  value = "${google_compute_global_address.raddit_static_ip.address}"
}

output "gitlab_static_ip" {
  value = "${google_compute_address.gitlab_static_ip.address}"
}

output "kubconfig" {
  value = " ... \nRun command to configure access via kubectl:\n$ gcloud container clusters get-credentials ${module.my_cluster.name} --zone ${var.zone} --project ${var.project_id}"
}
