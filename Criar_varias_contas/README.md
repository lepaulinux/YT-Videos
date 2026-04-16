# 👤 Criação de Usuários em Massa com Bash + CSV

Este projeto contém um script em Bash para criação automatizada de usuários Linux a partir de um arquivo CSV, com geração de senha aleatória e obrigatoriedade de troca no primeiro login.

---

## 📄 Estrutura do CSV

O arquivo `usuarios.csv` deve seguir o formato:

```csv
usuario,nome_completo
user555,Usuario Teste 1
user666,Usuario Teste 2
user777,Usuario Teste 3
```

---

## ⚙️ Funcionalidades

* Criação de usuários automaticamente
* Criação de diretório home (`/home/usuario`)
* Definição de nome completo (campo GECOS)
* Geração de senha aleatória segura
* Força troca de senha no primeiro login
* Compatível com distribuições Linux comuns

---

## 🧠 Script

```bash
#!/bin/bash

ARQUIVO="usuarios.csv"

# Ignora o cabeçalho
tail -n +2 "$ARQUIVO" | while IFS=',' read -r usuario nome
do
    # Gera senha aleatória
    senha=$(openssl rand -base64 12)

    # Cria o usuário
    useradd -m -c "$nome" -s /bin/bash "$usuario"

    # Define a senha
    echo "$usuario:$senha" | chpasswd

    # Força troca de senha no primeiro login
    chage -d 0 "$usuario"

    # Exibe informações
    echo "Usuário: $usuario"
    echo "Senha temporária: $senha"
    echo "----------------------------------"
done
```

---

## ▶️ Como usar

1. Clone o repositório:

```bash
git clone https://github.com/lepaulinux/YT-Videos/Criar_varias_contas.git
cd seu-repo
```

2. Dê permissão de execução:

```bash
chmod +x criar_usuarios.sh
```

3. Execute como root:

```bash
sudo ./criar_usuarios.sh
```

---

## 🔐 Segurança

⚠️ Atenção:

* As senhas são exibidas no terminal
* Evite armazenar senhas em texto plano em ambientes de produção
* Recomenda-se redirecionar a saída para um arquivo seguro:

```bash
sudo ./criar_usuarios.sh > senhas.txt
chmod 600 senhas.txt
```

---

## 📦 Requisitos

* Bash
* `openssl`
* Permissões de superusuário (root)

---

## 💡 Melhorias futuras

* Validação de usuários existentes
* Criação automática de grupos
* Importação de mais campos (email, UID, etc.)
* Envio de credenciais por email
* Log estruturado

---

## 📜 Licença

Este projeto é de uso livre para fins educacionais e administrativos.

---

## 🤝 Contribuição

Sinta-se à vontade para abrir issues ou pull requests com melhorias.

---

