locals {
  domain_slug          = var.dns_zone == null ? null : replace(replace(replace(lower(var.dns_zone), "/\\W|_|\\s/", "-"), "/-+/", "-"), "/-$/", "")
  domain_records_a     = { for k, v in var.dns_records : k => v if v.type == "A" }
  domain_records_cname = { for k, v in var.dns_records : k => v if v.type == "CNAME" }
  domain_records_txt   = { for k, v in var.dns_records : k => v if v.type == "TXT" }
  domain_records_ns    = { for k, v in var.dns_records : k => v if v.type == "NS" }
}

resource "google_dns_managed_zone" "main" {
  name     = "dns-${local.domain_slug}"
  dns_name = var.dns_zone

  dnssec_config {
    state = var.dnssec_enabled ? "on" : null
  }

  labels = {
    domain = local.domain_slug
  }
}

resource "google_dns_record_set" "main_a" {
  for_each = local.domain_records_a
  name     = each.value.name
  type     = "A"
  ttl      = each.value.ttl == null ? var.dns_default_ttl : each.value.ttl

  managed_zone = google_dns_managed_zone.main.name

  rrdatas = each.value.values
}

resource "google_dns_record_set" "main_txt" {
  for_each = local.domain_records_txt
  name     = each.value.name
  type     = "TXT"
  ttl      = each.value.ttl == null ? var.dns_default_ttl : each.value.ttl

  managed_zone = google_dns_managed_zone.main.name

  rrdatas = each.value.values
}

resource "google_dns_record_set" "main_cname" {
  for_each = local.domain_records_cname
  name     = each.value.name
  type     = "CNAME"
  ttl      = each.value.ttl == null ? var.dns_default_ttl : each.value.ttl

  managed_zone = google_dns_managed_zone.main.name

  rrdatas = each.value.values
}

resource "google_dns_record_set" "main_ns" {
  for_each = local.domain_records_ns
  name     = each.value.name
  type     = "NS"
  ttl      = each.value.ttl == null ? var.dns_default_ttl : each.value.ttl

  managed_zone = google_dns_managed_zone.main.name

  rrdatas = each.value.values
}
