output "ssh-connect" {
    value = "ssh -i ${var.private_key_path} root@${hcloud_server.hello-world.ipv4_address}"
}