resource "google_compute_global_address" "raddit_static_ip" {
  name = "raddit-static-ip"
}

resource "google_compute_address" "gitlab_static_ip" {
  name = "gitlab-static-ip"
}
