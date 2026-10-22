# Check logical volumes
sudo lvs

# Check block devices and filesystem sizes
lsblk -f

# Extend the logical volume by 200 MB
sudo lvresize -L +200M /dev/<volume-group>/lvol1

# Verify the new logical volume size
sudo lvs
sudo lvdisplay /dev/<volume-group>/lvol1
sudo resize2fs /dev/<volume-group>/lvol1

