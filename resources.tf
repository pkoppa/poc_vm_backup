resource "null_resource" "import_vm_image" {

  connection {
    type        = "ssh"
    user        = var.user_name
    private_key = var.private_key
    host        = var.launch_host_ip
    timeout     = "300s"
  }

  provisioner "remote-exec" {
    inline = [
      "aws ec2 import-image --description ${var.description_of_image}  --disk-containers \"file:///home/ubuntu/containers.json\""
    ]
  }
}


variable "user_name" {
}


variable "private_key" {
}


variable "launch_host_ip" {
}


variable "description_of_image" {
}
