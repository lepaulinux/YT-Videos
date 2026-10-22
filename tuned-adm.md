# Check the active TuneD profile
tuned-adm active

# Check the recommended profile
tuned-adm recommend

# List available TuneD profiles
tuned-adm list

# Apply a TuneD profile
sudo tuned-adm profile <profile-name>

# Check the current hostname
hostnamectl

# Change the system hostname
sudo hostnamectl set-hostname <new-hostname>

# Verify the new hostname
hostnamectl
