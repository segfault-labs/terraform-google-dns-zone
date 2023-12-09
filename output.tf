output "name_servers" {
  value = google_dns_managed_zone.main.name_servers
}

output "dns_zone_name" {
  value = google_dns_managed_zone.main.name
}

output "dns_name" {
  value = google_dns_managed_zone.main.dns_name
}
