# Create a physical volume
sudo pvcreate /dev/sdb1

# Create a 200 MB volume group named test
sudo vgcreate -s 200M test /dev/sdb1

# Check volume groups
sudo vgs

# Create a logical volume
sudo lvcreate -L 200M -n lvdata test

# Format the logical volume with ext4
sudo mkfs.ext4 /dev/test/lvdata

# Verify the logical volume
sudo lvs
sudo pvs
sudo vgs
# Check the filesystem
lsblk -f
