#!/usr/bin/env bash

set -e

echo "🚀 Iniciando configuração do terminal com Starship..."

# -------------------------------
# Verificação básica
# -------------------------------
if [[ "$EUID" -eq 0 ]]; then
  echo "⚠️  Não execute este script como root."
  exit 1
fi

# -------------------------------
# Atualiza repositórios
# -------------------------------
sudo apt update -y

# -------------------------------
# Instala dependências
# -------------------------------
echo "📦 Instalando dependências..."
sudo apt install -y curl wget fonts-firacode fonts-jetbrains-mono

# -------------------------------
# Instala Starship
# -------------------------------
if ! command -v starship &>/dev/null; then
  echo "✨ Instalando Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
else
  echo "✅ Starship já está instalado."
fi

# -------------------------------
# Backup do .bashrc
# -------------------------------
echo "🗂️  Criando backup do .bashrc..."
cp -v ~/.bashrc ~/.bashrc.bkp.$(date +%F_%H-%M-%S)

# -------------------------------
# Configura Starship no .bashrc
# -------------------------------
if ! grep -q "starship init bash" ~/.bashrc; then
  echo "🔧 Configurando Starship no .bashrc..."
  cat << 'EOF' >> ~/.bashrc

# --- STARSHIP PROMPT ---
eval "$(starship init bash)"
EOF
else
  echo "ℹ️  Starship já está configurado no .bashrc."
fi

# -------------------------------
# Cria ~/.config se não existir
# -------------------------------
mkdir -p ~/.config

# -------------------------------
# Baixa starship.toml
# -------------------------------
echo "⬇️  Baixando starship.toml..."
wget -q -O ~/.config/starship.toml \
"https://raw.githubusercontent.com/lepaulinux/linux/refs/heads/master/starship/starship.toml"

# -------------------------------
# Recarrega bashrc
# -------------------------------
echo "🔄 Recarregando .bashrc..."
source ~/.bashrc

# -------------------------------
# Exibe informações
# -------------------------------
echo
echo "📌 Starship instalado com sucesso!"
echo "Versão:"
starship --version

echo
echo "Shell detectado:"
echo "$STARSHIP_SHELL"

echo
echo "✅ Configuração finalizada!"
echo "Abra um novo terminal para ver o resultado."

