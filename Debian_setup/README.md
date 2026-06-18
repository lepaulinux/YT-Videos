# Debian Workstation Setup

A simple Bash script to quickly configure a fresh Debian 13 (or Ubuntu 24.04) installation with essential tools, virtualization support, Flatpak applications, SSH, and system tweaks.

## Features

* Updates the system packages
* Installs essential utilities:

  * btop
  * Gufw Firewall
  * OpenSSH Server
* Configures KVM/QEMU virtualization:

  * virt-manager
  * qemu-kvm
  * libvirt
* Automatically adds the current user to:

  * `libvirt`
  * `kvm`
* Installs and configures Flatpak + Flathub
* Installs common desktop applications:

  * Bitwarden
  * Discord
  * Google Chrome
  * OBS Studio
  * Obsidian
  * Proton VPN
  * VLC
  * FileZilla
  * Strawberry Music Player
  * and more
* Sets the system timezone to `Europe/Madrid`
* Performs package cleanup

## Usage

```bash
chmod +x setup.sh
./setup.sh
```

## Requirements

* Debian 13 or Ubuntu 24.04
* User with sudo privileges
* Internet connection

## Notes

After the installation completes, log out and log back in (or reboot) so the `libvirt` and `kvm` group permissions take effect.

## License

MIT

