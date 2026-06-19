output "server_name" {
  value = hcloud_server.linux_vm.name
}

output "server_ip" {
  value = hcloud_server.linux_vm.ipv4_address
}

output "server_location" {
  value = hcloud_server.linux_vm.location
}

output "ansible_inventory" {
  value = <<EOT
[webserver]
${hcloud_server.linux_vm.ipv4_address} ansible_user=root
EOT
}