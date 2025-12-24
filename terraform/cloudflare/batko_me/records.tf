resource "cloudflare_dns_record" "TXT_batko_me_zoho_verification" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "TXT"
  name    = cloudflare_zone.batko_me_zone.name
  content = "\"zoho-verification=zb40170236.zmverify.zoho.eu\""
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "MX_batko_me_10" {
  zone_id  = cloudflare_zone.batko_me_zone.id
  type     = "MX"
  priority = 10
  name     = cloudflare_zone.batko_me_zone.name
  content  = "mx.zoho.eu"
  ttl      = 1
  proxied  = false
}

resource "cloudflare_dns_record" "MX_batko_me_20" {
  zone_id  = cloudflare_zone.batko_me_zone.id
  type     = "MX"
  priority = 20
  name     = cloudflare_zone.batko_me_zone.name
  content  = "mx2.zoho.eu"
  ttl      = 1
  proxied  = false
}

resource "cloudflare_dns_record" "MX_batko_me_50" {
  zone_id  = cloudflare_zone.batko_me_zone.id
  type     = "MX"
  priority = 50
  name     = cloudflare_zone.batko_me_zone.name
  content  = "mx3.zoho.eu"
  ttl      = 1
  proxied  = false
}

resource "cloudflare_dns_record" "TXT_batko_me_spf" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "TXT"
  name    = cloudflare_zone.batko_me_zone.name
  content = "\"v=spf1 include:zohomail.eu ~all\""
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "TXT_zmail__domainkey_batko_me_dkim" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "TXT"
  name    = "zmail._domainkey.batko.me"
  content = "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCFD8ufkJgqqTzBNRO42Pu3sZCOeiMYpkqHFl+6ztDN2rfchRhosQA6rQCKMiOMP7yYSAjGCRDDy3y/2fKphc8TbiqGo0zE5lA39IW2ZhZueppXYPsgQsSTpHwOPstHcZxqyQ0BW/7qh9ht9Wr+1aJBp/pFopfTVVZrJJ2l4xfyJQIDAQAB\""
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "TXT__dmarc_batko_me_dmarc" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "TXT"
  name    = "_dmarc.batko.me"
  content = "\"v=DMARC1; p=reject; rua=mailto:aa48475ddb8246999364699932df3949@dmarc-reports.cloudflare.net; ruf=mailto:dmarc@batko.me; sp=reject; adkim=s; aspf=s; pct=100\""
  ttl     = 1
  proxied = false
}

# Placeholder DNS records for apex domain
resource "cloudflare_dns_record" "batko_me_placeholder" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "A"
  name    = "@"
  content = "192.0.2.1"
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "www_batko_me_placeholder" {
  zone_id = cloudflare_zone.batko_me_zone.id
  type    = "CNAME"
  name    = "www"
  content = "batko.me"
  ttl     = 1
  proxied = false
}
