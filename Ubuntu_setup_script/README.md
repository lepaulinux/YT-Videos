# 🛠️ Ubuntu 24.04 Setup Script

Script em Bash para automatizar a instalação e configuração de um ambiente básico em uma nova instalação do **Ubuntu 24.04**.

## 📌 Descrição

Este script realiza a atualização do sistema, instala aplicativos essenciais via APT, Snap e Flatpak, configura ambiente de virtualização (KVM/QEMU), instala ferramentas adicionais e prepara serviços básicos como SSH.

Ideal para acelerar a configuração inicial de uma máquina nova ou recém-formatada.

---

## ⚙️ Requisitos

* Ubuntu 24.04 instalado
* Usuário com privilégios de `sudo`
* Conexão com a internet

---

## 🚀 Como usar

1. Salve o script em um arquivo, por exemplo:

```bash
setup.sh
```

2. Dê permissão de execução:

```bash
chmod +x setup.sh
```

3. Execute:

```bash
./setup.sh
```

> ⚠️ O script solicitará sua senha de sudo durante a execução.

---

## 🔧 Configuração

Antes de executar, edite a variável:

```bash
USUARIO="user01"
```

Substitua pelo nome do seu usuário no sistema.

---

## 📦 O que o script faz

### 1. Atualização do sistema

* `apt update` e `apt upgrade`

### 2. Instalação via APT

* btop
* FileZilla
* Vim
* VLC
* GNOME Extension Manager

### 3. Virtualização (KVM/QEMU)

* virt-manager
* qemu-kvm
* libvirt

Configura o usuário nos grupos:

* `libvirt`
* `kvm`

> 🔁 Necessário logout/login após execução

---

### 4. Instalação via Snap

* Bitwarden
* Discord
* Obsidian
* Termius

---

### 5. Flatpak e aplicativos adicionais

* Flatpak + Flathub
* GNOME Tweaks
* Gufw (firewall)
* fzf

---

### 6. VPN

* Proton VPN (via Flatpak)

---

### 7. Limpeza

* Remove pacotes desnecessários:

  * imagemagick

---

### 8. SSH Server

* Instala e reinicia o OpenSSH Server

---

### 9. Configuração de timezone

* Define timezone para:

  ```
  Europe/Madrid
  ```

---

## 📋 Pós-instalação

Após a execução:

* 🔁 Faça logout e login novamente (necessário para virtualização funcionar corretamente)
* ✅ Verifique se todos os aplicativos foram instalados corretamente

---

## ⚠️ Observações

* O script usa `set -e`, ou seja, será interrompido se algum comando falhar
* Algumas configurações (como permitir root via SSH) estão comentadas por segurança
* Pode ser necessário ajustar conforme seu ambiente

---

## 👨‍💻 Autor

**Leandro Paulino**

---

## 📝 Licença

Uso livre para fins pessoais e educacionais.


