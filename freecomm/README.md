# SPC Collections: spc.freecomm

**SPC (Secured PC)** enhances the security and resiliency of your Linux PC using Ansible collections.

**SPC Freecomm** collection contains free but commercial products, generally clients like "chrome" or "onedrive". It is dependent on the **SPC Core** collection.

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

The `spc.core` collection must be installed.

## Installation

Run ansible to deploy locally or externally and after apply the displayed instructions:
```bash
ansible-playbook spc.freecomm.all
```
or if for instance to a VM (you'll need to declare it in the inventory before):
```bash
ansible-playbook spc.freecomm.all -l vm
```

Note it will ask for the sudo password.

## Usage

### Global usage

Everything downloaded or edited or to upload is from one of the "Téléchargements" subdirectories.

You can move these docs somewhere else or into this place doing:
```
mv ~/Téléchargements/<subdir>/<doc> <destination dir>
```
or in the reverse order.

### Launching a safe chrome window for browsing:

Type: `chrome`

### Storing your documents on MS cloud with OneDrive:

A Onedrive container runs in background, thanks to a community Docker image:
- see more at: https://github.com/abraunegg/onedrive

#### Postinstallation of the service

Here you can use this OneDrive image associated with 2 pod definitions installed in your ~/.config/pods directory:
- pod-ms_onedrive.yml is the normal one, launched by the installed service.
- pod-ops_msod.yml is the one you'll need to use just after the install, to initiate your MS OneDrive.

You will have to launch manually the last one by this command:
```
podman kube play pod-ops_msod.yml
```

At this time you need to initiate your config files: `config` and `sync_list`, located in ~/.config/onedrive directory, by editing them.

Then to connect to the launched container:
```
podman exec -it pk-onedrive-pk-onedrive bash
```

You will then set 2 boolean parameters `ONEDRIVE_REAUTH` and `ONEDRIVE_RESYNC`, start the main script `entrypoint.sh` and authenticate to the cloud service, following the instructions.

The doc associated with the image will give you further explanations.

The last step is to activate permanently the service:
```
systemctl --user enable pk-ms_onedrive.service
```
and reboot to check.

#### Usage of the service

It should be automatically started upon a boot.

Docs added locally into the `msOneDrive` directory will now be synchronized remotely and vice versa.

See more details in the documentation.

## Documentation

See [documentation](https://github.com/ldelatte/spc-ansible-collections/blob/main/core/docs/)

See also more general documentations:
- CentOS9 installation: https://tecadmin.net/download-centos-stream-9/
- Ansible collections usage: https://docs.ansible.com/ansible/latest/collections_guide/index.html
- Podman containers and pods management: https://podman.io/docs

