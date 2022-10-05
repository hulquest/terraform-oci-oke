resource "null_resource" "install_network_operator" {
  connection {
    host        = var.operator_private_ip
    private_key = local.ssh_private_key
    timeout     = "40m"
    type        = "ssh"
    user        = "opc"

    bastion_host        = var.bastion_public_ip
    bastion_user        = "opc"
    bastion_private_key = local.ssh_private_key
  }

  depends_on = [null_resource.install_k8stools_on_operator, null_resource.write_kubeconfig_on_operator]

  provisioner "file" {
    content     = local.install_network_operator_template
    destination = "/home/opc/install_network_operator.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/install_network_operator.sh\" ]; then bash \"$HOME/install_network_operator.sh\"; rm -f \"$HOME/install_network_operator.sh\";fi",
    ]
  }

  count = local.post_provisioning_ops == true && var.install_network_operator == true ? 1 : 0
}
