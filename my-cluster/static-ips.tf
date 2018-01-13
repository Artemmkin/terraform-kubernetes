resource "google_compute_global_address" "reddit_static_ip" {
  name = "reddit-static-ip"
}

resource "google_compute_address" "gitlab_static_ip" {
  name = "gitlab-static-ip"
}
