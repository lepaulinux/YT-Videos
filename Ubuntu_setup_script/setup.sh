#!/usr/bin/env bash

# Script para instalar aplicativos essenciais em uma nova instalação do Ubuntu 24.04
# Version 1.8
# By Leandro Paulino
#
# IMPORTANTE: Execute este script com um usuário que tenha privilégios de sudo.
# O script solicitará a senha de sudo quando necessário.

# Garante que o script pare se algum comando falhar
set -e

# --- Variáveis ---
USUARIO="user01"

# --- Início da Execução ---
echo "Iniciando a configuração do ambiente no Ubuntu 24.04..."

# 1. ATUALIZAÇÃO DO SISTEMA
echo "--------------------------------------------------"
echo "Atualizando os pacotes do sistema..."
echo "--------------------------------------------------"
sudo apt update && sudo apt upgrade -y

# 2. INSTALAÇÃO DE PACOTES VIA APT
# Apps dos repositórios oficiais do Ubuntu
echo "--------------------------------------------------"
echo "Instalando pacotes via APT..."
echo "--------------------------------------------------"
sudo apt install -y \
    btop \
    filezilla \
    vim \
    vlc \
    gnome-shell-extension-manager

# 3. INSTALAÇÃO DO AMBIENTE DE VIRTUALIZAÇÃO
# Instala KVM/QEMU e o Virtual Machine Manager
echo "--------------------------------------------------"
echo "Instalando o Virtual Machine Manager (KVM/QEMU)..."
echo "--------------------------------------------------"
sudo apt install -y virt-manager qemu-kvm libvirt-daemon-system

echo "Adicionando o usuário '$USUARIO' aos grupos 'libvirt' e 'kvm'..."
sudo usermod -aG libvirt "$USUARIO"
sudo usermod -aG kvm "$USUARIO"
echo "AVISO: É necessário reiniciar a sessão (fazer logout e login) para que as permissões de grupo do Virtual Machine Manager tenham efeito."

# 4. INSTALAÇÃO DE PACOTES VIA SNAP
# Apps que são comumente instalados via Snap Store
echo "--------------------------------------------------"
echo "Instalando pacotes via Snap..."
echo "--------------------------------------------------"
sudo snap install bitwarden
sudo snap install discord
sudo snap install obsidian --classic
sudo snap install termius-app

# 5. INSTALAÇÃO DE APPS DE TERCEIROS (DEB/REPOSITÓRIO)
echo "--------------------------------------------------"
echo "Instalando flatpak and Apps de Terceiros..."
echo "--------------------------------------------------"
# flatpak
sudo apt install -y flatpak
# Add repo
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Instalando aplicativos
sudo apt install gnome-tweaks -y
sudo apt install gufw -y
sudo apt install fzf -y

# Proton VPN
echo "--------------------------------------------------"
echo "Instalando Proton VPN..."
echo "--------------------------------------------------"
sudo flatpak -y install flathub com.protonvpn.www


# Remove
# sudo apt remove thunderbird -y
sudo apt purge imagemagick-6.q16 imagemagick-6-common -y

# 7. INSTALAÇÃO DO SHH SERVER
echo "--------------------------------------------------"
echo "Instalando Open SSH Server..."
echo "--------------------------------------------------"
sudo apt install openssh-server -y
# Add 'PermitRootLogin yes' to the end of /etc/ssh/sshd_config
# sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
# Restart the SSH service
sudo systemctl restart ssh

# Set the timezone
sudo timedatectl set-timezone Europe/Madrid

# --- FINALIZAÇÃO ---
echo "--------------------------------------------------"
echo "Instalação concluída!"
echo "--------------------------------------------------"
echo "Programas instalados:"
echo "- btop, FileZilla, Vim, VLC, Extensions Manager (via APT)"
echo "- Virtual Machine Manager (com usuário $USUARIO configurado)"
echo "- Bitwarden, Discord, Obsidian, Termius, Stremio (via Snap)"
echo "- Proton VPN"
echo ""
echo "LEMBRE-SE: Faça logout e login novamente para usar o Virtual Machine Manager sem precisar de 'sudo'."
echo "--------------------------------------------------"
