### Check available volume groups
sudo vgs

### Create a 500 MB logical volume for swap
sudo lvcreate -L 500M -n swaplv <volume-group>

### Initialize the logical volume as swap
sudo mkswap /dev/<volume-group>/swaplv

### Enable the swap volume
sudo swapon /dev/<volume-group>/swaplv

### Verify active swap space
swapon --show
free -h

### Check logical volumes
sudo lvs
