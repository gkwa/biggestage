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
  output_image = "ubuntu-jammy"
  reuse        = true
}

build {
  sources = ["incus.jammy"]

  provisioner "file" {
    source      = "examples/common/90-incus"
    destination = "/tmp/90-incus"
  }

  provisioner "shell" {
    scripts = [
      "packages.sh",
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "playbook.yml"
  }
}

