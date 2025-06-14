#!/bin/bash

sudo apt update
#sudo apt upgrade -y
sudo apt install grml-rescueboot zsh -y
sudo mkdir -p /boot/grml
 if [ ! -f /boot/grml/grml-small-2024.12-amd64.iso ]; then
  sudo wget https://mirror-hk.koddos.net/grml/grml-small-2024.12-amd64.iso -P /boot/grml/ --no-check-certificate
 fi
 
#sudo tee /grml.sh > /dev/null << 'EOF'
#!/bin/bash
#put yourscript here for executioon boot GRML and eanable myconfig=/dev/vda3 scripts=/grml.sh
#dns=8.8.8.8,8.8.4.4 netscript=raw.githubusercontent.com/user../autorun-grml.sh
#touch /sukses.txt
#EOF
#sudo chmod +x /grml.sh

sudo bash -c "echo 'CUSTOM_BOOTOPTIONS=\"ssh=pas123 dns=8.8.8.8,8.8.4.4 netscript=raw.githubusercontent.com/lamtota40/install-ulang/main/autorun-grml.sh toram\"' >> /etc/default/grml-rescueboot"
sudo update-grub
sudo grub-reboot 'Grml Rescue System (grml-small-2024.12-amd64.iso)'
read -p "tekan [ENTER] untuk reboot"
rm -rf setup-grml.sh
sudo reboot
