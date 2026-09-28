### 💻 Commands used

Check the manual:
```bash
man firewall-cmd
```
Add a port permanently to a specific zone:
```
sudo firewall-cmd --zone=<zone> --add-port=<port>/<protocol> --permanent
```
Reload the firewall configuration:
```
sudo firewall-cmd --reload
```
Verify the configured ports:
```
sudo firewall-cmd --zone=<zone> --list-ports
```
This is a useful workflow to understand how firewalld zones, permanent rules, and port configuration work on Linux.
