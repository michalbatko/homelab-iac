resource "cloudflare_zone" "batko_me_zone" {
  name   = "batko.me"
  paused = false
  type   = "full"
  account = {
    id   = var.account_id
    name = var.account_name
  }
}
