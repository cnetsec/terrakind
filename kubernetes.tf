terraform {
  required_providers {
    kind = {
      source = "unicell/kind"
      version = "0.0.2-u2"
    }
  }
}
resource "kind_cluster" "default" {
    name = "kubernetes-goat-cluster"
}

resource "null_resource" "kubernetesgoat" {
 depends_on = [kind_cluster.default]
 provisioner "local-exec" {
    command = "chmod +x setup-kubernetes-goat.sh"
        }
 provisioner "local-exec" {
    command = "setup-kubernetes-goat.sh"
    interpreter = ["bash"]
        }
 provisioner "local-exec"{
    command = "access-kubernetes-goat.sh"
    interpreter = ["bash"]
        }

}
