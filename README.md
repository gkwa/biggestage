

``bash
git clone https://github.com/taylormonacelli/biggestage
cd biggestage

incus admin init --auto
packer init molecule.pkr.hcl
packer build molecule.pkr.hcl

incus launch ubuntu-molecule molecule
incus file push my_role.sh molecule/root/my_role.sh
incus exec molecule -- bash -x /root/my_role.sh
incus exec molecule -- bash
```