resource "google_service_account" "gitlab_ci" {
  account_id   = "gitlab-ci"
  display_name = "Gitlab CI"
}

resource "google_service_account_key" "gitlab_ci" {
  service_account_id = "${google_service_account.gitlab_ci.id}"
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_policy" "gitlab_policy" {
  project     = "${var.project_id}"
  policy_data = "${data.google_iam_policy.gitlab_ci.policy_data}"
}

data "google_iam_policy" "gitlab_ci" {
  binding {
    role = "roles/container.developer"

    members = [
      "serviceAccount:${google_service_account.gitlab_ci.email}",
    ]
  }
}
