resource "google_dns_managed_zone" "jump" {
  name        = "jump-zone"
  dns_name    = "jump.dokonb.cr460lab.com."
  description = "Production DNS zone"
  
    }
resource "google_dns_managed_zone" "vault" {
  name        = "vault-zone"
  dns_name     = "vault.dokonb.cr460lab.com."

  }
