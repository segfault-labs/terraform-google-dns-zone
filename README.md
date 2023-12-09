

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dns_managed_zone.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |
| [google_dns_record_set.main_a](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.main_cname](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.main_ns](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.main_txt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_default_ttl"></a> [dns\_default\_ttl](#input\_dns\_default\_ttl) | n/a | `number` | `300` | no |
| <a name="input_dns_records"></a> [dns\_records](#input\_dns\_records) | n/a | <pre>map(object({<br>    name   = string<br>    type   = string<br>    ttl    = number<br>    values = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | n/a | `string` | `null` | no |
| <a name="input_dnssec_enabled"></a> [dnssec\_enabled](#input\_dnssec\_enabled) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | n/a |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | n/a |
<!-- END_TF_DOCS -->