packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "incus" "jammy" {
  image        = "images:ubuntu/jammy"
  output_image = "ubuntu-molecule"
  reuse        = true
}

build {
  sources = ["incus.jammy"]

  provisioner "shell" {
    scripts = [
      "molecule.sh",
    ]
  }
}


