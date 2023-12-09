variable "dns_zone" {
  type    = string
  default = null
}

variable "dns_records" {
  type = map(object({
    name   = string
    type   = string
    ttl    = number
    values = list(string)
  }))

  default = {}
}

variable "dns_default_ttl" {
  type    = number
  default = 300
}

variable "dnssec_enabled" {
  type    = bool
  default = true
}
