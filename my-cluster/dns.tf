resource "google_dns_managed_zone" "primary" {
  name        = "raddit-zone"
  dns_name    = "devops-by-practice.fun."
  description = "DNS zone for the Raddit domain"
}

resource "google_dns_record_set" "a_raddit" {
  name = "${google_dns_managed_zone.primary.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.primary.name}"

  rrdatas = ["${google_compute_global_address.raddit_static_ip.address}"]
}

resource "google_dns_record_set" "cname_raddit" {
  name = "www.${google_dns_managed_zone.primary.dns_name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.primary.name}"

  rrdatas = ["${google_dns_managed_zone.primary.dns_name}"]
}

resource "google_dns_record_set" "gitlab" {
  # wild card domain name for gitlab services
  name = "*.ci.${google_dns_managed_zone.primary.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.primary.name}"

  rrdatas = ["${google_compute_address.gitlab_static_ip.address}"]
}
