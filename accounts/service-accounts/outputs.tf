output "gitlab_sa_key" {
  value = "${google_service_account_key.gitlab_ci.private_key}"
}
