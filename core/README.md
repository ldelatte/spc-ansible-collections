# SPC Collections: spc.core and others

**SPC (Secured PC)** enhances the security and resiliency of your Linux PC using Ansible collections.

## Presentation

Want to securely surf the web while protecting your local data stored on your Linux PC, whether it be about health, crypto, or your clients' data?

A fresh Linux installation provides a fair level of security, including a firewall and SELinux, but no antivirus. This resource adds an antivirus (ClamAV) and deploys its included applications in a fully segmented manner, based mainly on containers, namespaces, and internal network isolation.

The targeted effect is that in case of malware or intrusion in one application, none of the others will be affected, nor their documents, nor the host's system. Your other specific applications may run as is and will be isolated from the above. Better than nothing if they are required. Or better use it from KVM that is included.

As isolation is implemented, a document stored in a directory belonging to app1 will not be seen by app2. You choose exactly which document you put in visibility to app2 by moving or copying it yourself into app2's area. For instance, you move a recently downloaded file from a browser's download directory to your OneDrive area at your own initiative.

Furthermore, each time you shut down your PC, it will start the next session with a set of new fresh containers/apps/temp storage and forget most changes done previously apart from your permanent data storage.

Still, don't forget security is a matter of global approach.

## Communication

- On the discussions tab in GitHub
- By mail: L. Delatte <ldelatte1@laposte.net>

## Release Notes

See [changelog](https://github.com/ldelatte/spc-ansible-collections/blob/main/core/changes/CHANGES.md)

## Release Policy

The main branch is used for the development of the latest versions of the collections and may contain breaking changes. The stable-* branches (e.g., stable-1 for the 1.x.y releases) are used to cut additional minor or patch releases if needed, but we do not provide official support for multiple versions of the collection.

## Licensing

Under GPL-3.0 or later.
Copyright 2024: ldelatte1@laposte.net

## Roadmap

See [roadmap](https://github.com/ldelatte/spc-ansible-collections/blob/main/core/changes/ROADMAP.md)

## Contribution

Contributions are welcome! Please see the contributing guidelines for more information.

## Prerequisite

### Target PC

- Linux versions: Tested on CentOS Stream 9
- The installation of the target Linux included the options "server with GUI" like Gnome and "container support" like podman.
- By default, /data is the directory that will contain your permanent data: docs, video, etc ... Better deploy it on its own volume.
- It must be accessible by the ansible machine, either directly (same machine) or via ssh.
- sudo rights (and password) for the user on the target PC used for the deployment of the collections.

### Ansible machine, if different

- Ansible version 2.14 and above.

## Installation

### All from the ansible machine:

First install `ansible-core` package:
```bash
dnf install -y ansible-core
```

You should then place the collection (clone the repository) into the Ansible collection path. Normally this is `~/.ansible/collections/ansible_collections/<namespace>/<collection>`, so for the core collection it would be: `~/.ansible/collections/ansible_collections/spc/core`:

```bash
git clone git@github.com\:ldelatte/spc-ansible-collections.git ~/.ansible/collections/ansible_collections/spc
```

If you plan to install from a directory other than ~/.ansible/collections/ansible_collections/spc, copy the `ansible.cfg` file to it.

```bash
cp ~/.ansible/collections/ansible_collections/spc/ansible.cfg <your_directory>
```

After this you just need to run ansible to deploy locally or externally and after to apply the displayed instructions:
```bash
ansible-playbook spc.core.all
```
or if for instance to a VM (you'll need to declare it in the inventory before):
```bash
ansible-playbook spc.core.all -l vm
```

Note it will ask for the sudo password.

You can then continue with the last command for another SPC collection by replacing `core` with its name.

The list of locally available collections can be displayed with this command:
```bash
ansible-galaxy collection list
```

See more details in the documentation.

## Usage

### Global usage

Everything downloaded or edited or to upload is from one of the "Téléchargements" subdirectories.

You can move these docs somewhere else or into this place doing:
```
mv ~/Téléchargements/<subdir>/<doc> <destination dir>
```
or in the reverse order.

### Launching a safe xterm window for testing:

Type: `xterm`

### Launching a safe Firefox window:

Type any of `tec` or `pro` or `ach`, which are isolated from each other browsers.

### Editing some documents with LibreOffice in a safe window:

Type: `doc` first to (re)start the service.

Then `lbo` for editing docs.

Done thanks to the community docker image.

### Browsing your documents inplace in a safe window (readonly mode):

#### Postinstallation of the service

To activate permanently the service:
```
systemctl --user enable pk-viewer.service
```
and reboot to check.

#### Viewer usage

Type: `disp` or `disp <some docs path>`

For example:
```
cd ~/Images
disp <some images names>
```

Suited for text docs and images.

### Activate a local ssh daemon to access the PC remotely and safely:

Start the daemon (and when finished your job you normally stop it):
```
systemctl --user start pk-sshd.service
```
Then access to your PC:
```
ssh -p 6022 user@<IP_of_your_PC>
```
using the password you have configured during the collection postinstallation.

### "Glances" for a system view in a safe window:

Type: `glances`

See more details in the documentation.

## Documentation

See [documentation](https://github.com/ldelatte/spc-ansible-collections/blob/main/core/docs/)

See also more general documentations:
- CentOS9 installation: https://tecadmin.net/download-centos-stream-9/
- Ansible collections usage: https://docs.ansible.com/ansible/latest/collections_guide/index.html
- Podman containers and pods management: https://podman.io/docs

