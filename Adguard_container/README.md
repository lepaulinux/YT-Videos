# 🚀 AdGuard Home em LXC com Docker

Este repositório acompanha um vídeo onde mostro como utilizar o **AdGuard Home** rodando em um container **LXC**, utilizando **Docker**, com foco em privacidade, segurança e controle de DNS na rede.

Além da instalação, o conteúdo apresenta a configuração que utilizo no dia a dia, incluindo provedores DNS via **DNS-over-HTTPS (DoH)** e diversas listas de bloqueio para proteção contra anúncios, rastreadores, phishing e malware.

No final, é feita uma demonstração prática em um sistema **Fedora**, configurando o AdGuard como DNS padrão para validar o funcionamento na prática.

---

## 🎯 Objetivo

Centralizar o gerenciamento de DNS da rede, proporcionando:

- 🚫 Bloqueio de anúncios e rastreadores  
- 🛡️ Proteção contra domínios maliciosos e phishing  
- 🔒 Maior privacidade com uso de DoH  
- ⚡ Melhor controle e visibilidade do tráfego DNS  

---

## 📡 Provedores DNS (DoH) utilizados

- https://dns.cloudflare.com/dns-query  
- https://all.dns.mullvad.net/dns-query  
- https://dns10.quad9.net/dns-query  
- https://dns.adguard-dns.com/dns-query  
- https://dns.google/dns-query  

---

## 🛡️ Listas de Bloqueio configuradas

- AdGuard DNS Filter  
- HaGeZi's Apple Tracker Blocklist  
- Peter Lowe's Blocklist  
- Phishing Army  
- Phishing URL Blocklist (PhishTank)  
- uBlock₀ Filters – Badware Risks  
- Malicious URL Blocklist (URLHaus)  
- Steven Black's List  
- Dandelion Sprout's Anti-Malware  
- Dan Pollock's List  

---

## 🧪 Demonstração

O vídeo inclui um teste prático utilizando o Fedora, onde o sistema é configurado para usar o AdGuard como DNS padrão, demonstrando o bloqueio e a filtragem em tempo real.

---

## 📺 Vídeo

Confira o vídeo completo para ver todo o processo e a configuração em ação.

---

## 📄 Licença

Este projeto é livre para uso e modificação.
