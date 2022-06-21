resource "digitalocean_volume" "volume" {
  region                  = "lon1"
  name                    = "main-volume"
  size                    = 10
  initial_filesystem_type = "ext4"
}
