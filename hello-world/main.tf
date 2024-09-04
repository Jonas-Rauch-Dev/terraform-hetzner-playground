terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "hello-world" {
    name = "hello-world-server"
    image = var.server_image
    server_type = var.server_type
    location = var.location
    ssh_keys = [ hcloud_ssh_key.hello-world-key.name ]

    public_net {
      ipv4_enabled = true
      ipv6_enabled = false
    }
}

resource "hcloud_ssh_key" "hello-world-key" {
  name = "hello-world-key"
  public_key = file(var.public_key_path)
}