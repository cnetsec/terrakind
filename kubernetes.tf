terraform {
  required_providers {
    kind = {
      source = "unicell/kind"
      version = "0.0.2-u2"
    }
  }
}
resource "kind_cluster" "default" {
    name = "test-cluster"
}

resource "null_resource" "kubernetesgoat" {

 provisioner "local-exec" {
    command = "chmod +x setup-kubernetes-goat.sh"
  }
 provisioner "local-exec" {
    command = "bash setup-kubernetes-goat.sh"
  }
 provisioner "local-exec" {
    command = "bash access-kubernetes-goat.sh"
  }
}
