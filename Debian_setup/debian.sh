#!/usr/bin/env bash

# Script para configurar uma nova instalação Debian 13 / Ubuntu 24.04
# Versão 3.0
# By Leandro Paulino
#
# IMPORTANTE:
# Execute com um usuário que possua privilégios sudo.
# O script solicitará a senha quando necessário.

set -e
set -o pipefail

# Usuário que está executando o script
USUARIO=${SUDO_USER:-$USER}

echo "=================================================="
echo "Iniciando a configuração do ambiente..."
echo "Usuário detectado: $USUARIO"
echo "=================================================="

# --------------------------------------------------
# Atualização do sistema
# --------------------------------------------------
echo "Atualizando os pacotes do sistema..."
sudo apt update
sudo apt upgrade -y

# --------------------------------------------------
# Pacotes básicos
# --------------------------------------------------
echo "Instalando pacotes básicos..."
sudo apt install -y \
    btop \
    gufw \
    flatpak \
    gnome-software-plugin-flatpak \
    openssh-server

# --------------------------------------------------
# Virtualização (KVM/QEMU)
# --------------------------------------------------
echo "Instalando ambiente de virtualização..."

sudo apt install -y \
    virt-manager \
    qemu-kvm \
    libvirt-daemon-system

if id "$USUARIO" &>/dev/null; then
    sudo usermod -aG libvirt "$USUARIO"
    sudo usermod -aG kvm "$USUARIO"

    echo "Usuário '$USUARIO' adicionado aos grupos:"
    echo "- libvirt"
    echo "- kvm"
else
    echo "AVISO: usuário '$USUARIO' não encontrado."
fi

# --------------------------------------------------
# Flatpak + Flathub
# --------------------------------------------------
echo "Configurando Flatpak..."

sudo flatpak remote-add --if-not-exists flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo

# --------------------------------------------------
# Aplicativos Flatpak
# --------------------------------------------------
echo "Instalando aplicativos Flatpak..."

APPS=(
    com.bitwarden.desktop
    com.discordapp.Discord
    com.github.jeromerobert.pdfarranger
    com.google.Chrome
    com.obsproject.Studio
    com.protonvpn.www
    com.rtosta.zapzap
    io.github.kolunmi.Bazaar
    io.gitlab.adhami3310.Impression
    io.gitlab.ilshat_apps.manuscript
    md.obsidian.Obsidian
    org.filezillaproject.Filezilla
    org.strawberrymusicplayer.strawberry
    org.videolan.VLC
)

sudo flatpak install -y flathub "${APPS[@]}"

# --------------------------------------------------
# SSH Server
# --------------------------------------------------
echo "Configurando OpenSSH Server..."

sudo systemctl enable --now ssh

# --------------------------------------------------
# Fuso horário
# --------------------------------------------------
echo "Configurando timezone..."

sudo timedatectl set-timezone Europe/Madrid

# --------------------------------------------------
# Limpeza
# --------------------------------------------------
echo "Realizando limpeza do sistema..."

sudo apt autoremove -y
sudo apt autoclean

# --------------------------------------------------
# Finalização
# --------------------------------------------------
echo ""
echo "=================================================="
echo "CONFIGURAÇÃO CONCLUÍDA COM SUCESSO!"
echo "=================================================="
echo ""
echo "Pacotes APT instalados:"
echo " - btop"
echo " - gufw"
echo " - flatpak"
echo " - gnome-software-plugin-flatpak"
echo " - openssh-server"
echo " - virt-manager"
echo " - qemu-kvm"
echo " - libvirt-daemon-system"
echo ""
echo "Aplicativos Flatpak instalados:"
echo " - Bitwarden"
echo " - Discord"
echo " - PDF Arranger"
echo " - Google Chrome"
echo " - OBS Studio"
echo " - Proton VPN"
echo " - ZapZap"
echo " - Bazaar"
echo " - Impression"
echo " - Manuscript"
echo " - Obsidian"
echo " - FileZilla"
echo " - Strawberry"
echo " - VLC"
echo ""
echo "Timezone configurado: Europe/Madrid"
echo ""
echo "IMPORTANTE:"
echo "Faça logout/login (ou reinicie o sistema)"
echo "para que os grupos libvirt e kvm tenham efeito."
echo "=================================================="

