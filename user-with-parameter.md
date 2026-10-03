# Linux User Management: Password Expiration & Account Inactivity
```bash
sudo adduser -u 7000 -c "user70 for backup" -f 30 user70

sudo passwd -u user70

sudo grep user70 /etc/shadow
```
