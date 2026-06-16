#!/usr/bin/env bash

set -e

echo "=== Configuração do Starship ==="

# Verifica se curl está instalado
if ! command -v curl &> /dev/null; then
    echo "curl não encontrado. Instalando..."
    sudo dnf install -y curl
else
    echo "curl já está instalado."
fi

# Instala o Starship
echo "Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Vai para o diretório home
cd ~

# Backup do .bashrc
if [ -f .bashrc ]; then
    echo "Criando backup do .bashrc..."
    cp -v .bashrc .bashrc.bkp
fi

# Adiciona configuração do Starship ao .bashrc se ainda não existir
if ! grep -q 'starship init bash' .bashrc; then
    cat << 'EOF' >> .bashrc

# --- STARSHIP PROMPT ---
eval "$(starship init bash)"
EOF
    echo "Configuração adicionada ao .bashrc"
else
    echo "Configuração do Starship já existe no .bashrc"
fi

# Recarrega o .bashrc
echo "Recarregando .bashrc..."
source .bashrc || true

# Cria ~/.config se não existir
mkdir -p ~/.config

# Acessa o diretório ~/.config
cd ~/.config

# Baixa o arquivo starship.toml
echo "Baixando starship.toml..."
wget -O starship.toml \
"https://raw.githubusercontent.com/lepaulinux/YT-Videos/refs/heads/main/starship_script/starship.toml"

# Exibe informações
echo
echo "=== Informações ==="
starship --version

echo
echo "Shell detectado:"
echo "${STARSHIP_SHELL:-Não definido ainda}"

echo
read -p "Deseja instalar as fontes FiraCode e JetBrains Mono? (s/N): " INSTALAR_FONTES

if [[ "$INSTALAR_FONTES" =~ ^[Ss]$ ]]; then
    sudo dnf install -y fonts-firacode fonts-jetbrains-mono
fi

# Volta para home
cd ~

# Recarrega novamente
echo "Recarregando .bashrc..."
source .bashrc || true

echo
echo "================================="
echo "Configuração finalizada com sucesso!"
echo "Abra um novo terminal caso o prompt não seja atualizado imediatamente."
echo "================================="
