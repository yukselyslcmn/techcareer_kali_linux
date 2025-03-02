#!/bin/bash

# chmod +x _01_kali_startup_setup.sh
# sed -i -e 's/\r$//' _01_kali_startup_setup.sh
# ./_01_kali_startup_setup.sh


# Eğer scriptin Windows'tan aktarıldıysa, satır sonları Windows (CRLF) formatında olabilir. Linux, LF (Line Feed) kullanır
# ve bu durum bad interpreter hatasına neden olabilir.
# Bash scriptini LF formatına çevirmek için aşağıdaki komutları kullan:
# sed -i -e 's/\r$//' _01_kali_startup_setup.sh
# veya
# dos2unix install_docker_git.sh


# ================================
# 🛠️ Kali Linux Başlangıç Ayarları
# ================================

# 💡 Renk Kodları
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
NC="\e[0m"

echo -e "${GREEN}🚀 Kali Linux Başlangıç Ayarları Yapılandırılıyor...${NC}"

# ======================================
# 1️- Türkçe Klavye Ayarlarını Kalıcı Yapma
# ======================================
echo -e "${YELLOW}📌 Klavye düzeni Türkçe olarak ayarlanıyor...${NC}"
sudo localectl set-keymap tr
sudo localectl set-x11-keymap tr

# Kalıcı olması için dosyayı düzenle
echo "XKBMODEL=pc105" | sudo tee /etc/default/keyboard
echo "XKBLAYOUT=tr" | sudo tee -a /etc/default/keyboard
echo "XKBVARIANT=" | sudo tee -a /etc/default/keyboard
echo "XKBOPTIONS=" | sudo tee -a /etc/default/keyboard

# ======================================
# 2️- Bölgesel Ayarlar ve Saat Dilimi (TR)
# ======================================
echo -e "${YELLOW}📌 Saat dilimi Türkiye olarak ayarlanıyor...${NC}"
sudo timedatectl set-timezone Europe/Istanbul
sudo timedatectl set-ntp on

# Dil ve Yerel Ayarları Türkçeye Çevirme
echo -e "${YELLOW}📌 Dil ve yerel ayarlar Türkçe yapılıyor...${NC}"
sudo localectl set-locale LANG=tr_TR.UTF-8
sudo update-locale LANG=tr_TR.UTF-8

# ======================================
# 3️- Çözünürlük Ayarlarını Yapılandırma
# ======================================
echo -e "${YELLOW}📌 Çözünürlük ayarlanıyor...${NC}"

# VirtualBox için varsayılan çözünürlük belirleme
if [ "$(dmidecode -s system-manufacturer)" == "innotek GmbH" ]; then
    echo -e "${YELLOW}📌 VirtualBox ortamı algılandı. Çözünürlük ayarlanıyor...${NC}"
    sudo xrandr --output Virtual1 --mode 1920x1080
elif [ "$(dmidecode -s system-manufacturer)" == "VMware, Inc." ]; then
    echo -e "${YELLOW}📌 VMware ortamı algılandı. Çözünürlük ayarlanıyor...${NC}"
    sudo xrandr --output Virtual1 --mode 1920x1080
else
    echo -e "${YELLOW}📌 Fiziksel makine algılandı. Varsayılan çözünürlük 1920x1080 yapılıyor...${NC}"
    sudo xrandr --output eDP-1 --mode 1920x1080
fi

# ======================================
# 4️- Ağ Ayarları ve Hostname Değiştirme
# ======================================
echo -e "${YELLOW}📌 Ağ ayarları yapılandırılıyor...${NC}"

# Yeni hostname belirleme
NEW_HOSTNAME="KaliTR"
echo -e "${YELLOW}📌 Hostname değiştiriliyor: $NEW_HOSTNAME${NC}"
echo "$NEW_HOSTNAME" | sudo tee /etc/hostname
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts

# DNS Ayarlarını Google DNS olarak ayarlama
echo -e "${YELLOW}📌 Google DNS kullanılıyor...${NC}"
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# ======================================
# 5️- Performans Optimizasyonu ve Sistem Temizliği
# ======================================
echo -e "${YELLOW}⚡ Performans ayarları yapılıyor...${NC}"

# Gereksiz servisleri kapatma
sudo systemctl disable bluetooth
sudo systemctl stop bluetooth

# Gereksiz log dosyalarını temizleme
sudo journalctl --vacuum-size=100M

# Gereksiz paketleri kaldırma
sudo apt autoremove -y
sudo apt autoclean -y

# Swap Kullanımını Optimize Etme
echo -e "${YELLOW}📌 Swap kullanımı optimize ediliyor...${NC}"
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# ======================================
# 6️- Otomatik Başlangıç Uygulamaları Yönetimi
# ======================================
echo -e "${YELLOW}📌 Otomatik başlangıç uygulamaları ayarlanıyor...${NC}"

# Varsayılan açılış ekranını terminal yap
echo "[Desktop]" | sudo tee /etc/xdg/autostart/terminal.desktop
echo "Type=Application" | sudo tee -a /etc/xdg/autostart/terminal.desktop
echo "Exec=xfce4-terminal" | sudo tee -a /etc/xdg/autostart/terminal.desktop
echo "X-GNOME-Autostart-enabled=true" | sudo tee -a /etc/xdg/autostart/terminal.desktop

# ZSH ve Oh My Zsh etkinleştirme
echo -e "${YELLOW}📌 Terminal özelleştiriliyor...${NC}"
sudo apt install -y zsh
chsh -s $(which zsh)

# ======================================
# 7️-Son Temizlik ve Bitirme
# ======================================
echo -e "${YELLOW}🧹 Son temizlik işlemleri yapılıyor...${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${GREEN}🎉 Kali Linux başlangıç ayarları tamamlandı! Sistemi yeniden başlatabilirsiniz.${NC}"
