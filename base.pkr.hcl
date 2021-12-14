variable "project_id" {
    type    = string
    default = "instruqt"
}

source "googlecompute" "centos" {
    project_id          = var.project_id    
    source_image_family = "centos-7"
    ssh_username        = "packer"
    zone                = "europe-west1-b"
    machine_type        = "n1-standard-4"
    image_family        = "centos-7"
}

build {
    sources = ["sources.googlecompute.centos"]

    provisioner "shell" {
        inline = [
            "sudo yum update -y",
            "sudo yum install -y git",            
        ]
    }
}
