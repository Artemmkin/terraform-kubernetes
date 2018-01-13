provider "google" {
  version = "~> 1.4.0"
  project = "${var.project_id}"
  region  = "${var.region}"
}
