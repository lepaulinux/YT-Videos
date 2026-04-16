#!/usr/bin/env bash

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

    # Mostra resultado
    echo "Usuário: $usuario"
    echo "Senha temporária: $senha"
    echo "----------------------------------"
done
