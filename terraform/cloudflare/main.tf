resource "cloudflare_account" "primary_account" {
  name = "Michal Batko"
  type = "standard"
  settings = {
    abuse_contact_email = "admin@batko.me"
    enforce_twofactor   = true
  }
}

module "batko_me" {
  source = "./batko_me"

  account_id   = cloudflare_account.primary_account.id
  account_name = cloudflare_account.primary_account.name
}
