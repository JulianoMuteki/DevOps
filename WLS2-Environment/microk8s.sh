sudo apt update && apt upgrade -y

# Install the required packages for SystemD
apt install -yqq fontconfig daemonize
# Creates a default user and adds it to the sudo group
useradd -m -s /bin/bash -G sudo mk8s
# Reset the password of the default user
passwd mk8s


# Edit the sudoers to remove the password request
visudo
    %sudo   ALL=(ALL:ALL) NOPASSWD: ALL



# Create the wsl.conf file
nano /etc/wsl.conf
[automount]
enabled = true
options = "metadata,uid=1000,gid=1000,umask=22,fmask=11,case=off"
mountFsTab = true
crossDistro = true

[network]
generateHosts = false
generateResolvConf = true

[interop]
enabled = true
appendWindowsPath = true

[user]
default = mk8s


sudo systemctl restart systemd-resolved
sudo apt update