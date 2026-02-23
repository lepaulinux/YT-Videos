# 🚀 Starship Terminal Setup (Ubuntu / Debian)

Este repositório contém um script Bash para configurar automaticamente o terminal com o **Starship Prompt**, incluindo fontes recomendadas, backup do `.bashrc` e aplicação de um arquivo de configuração personalizado (`starship.toml`).

O objetivo é deixar o terminal mais **moderno, informativo e produtivo**, com o mínimo de esforço manual.

---

## 📋 O que este script faz

O script executa as seguintes etapas:

- Verifica se não está sendo executado como **root**
- Atualiza os repositórios do sistema
- Instala dependências necessárias
- Instala o **Starship Prompt**
- Cria backup do arquivo `.bashrc`
- Configura o Starship no Bash
- Baixa um `starship.toml` personalizado
- Recarrega o ambiente
- Exibe informações finais de confirmação

---

## 🖥️ Sistemas compatíveis

- Ubuntu  
- Debian  
- Distribuições baseadas em Debian (Linux Mint, Pop!_OS, etc.)

⚠️ O script foi feito **exclusivamente para Bash** (`.bashrc`).

---

## 📦 Dependências instaladas

O script instala automaticamente os seguintes pacotes:

- `curl`
- `wget`
- `fonts-firacode`
- `fonts-jetbrains-mono`

Essas fontes são recomendadas para o funcionamento correto do **Starship Prompt**.
