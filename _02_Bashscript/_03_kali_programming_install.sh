#!/bin/bash

# chmod +x _03_kali_programming_install.sh
# ./_03_kali_programming_install.sh

# Eğer scriptin Windows'tan aktarıldıysa, satır sonları Windows (CRLF) formatında olabilir.
# Linux, LF (Line Feed) kullanır ve bu durum bad interpreter hatasına neden olabilir.
# Bash scriptini LF formatına çevirmek için aşağıdaki komutları kullan:
# sed -i -e 's/\r$//' _03_kali_programming_install.sh
# veya
# dos2unix _03_kali_programming_install.sh

# git --version
# docker --version
# docker run hello-world


# Varaible
# User Variable
SYSTEM="System Güncellemesi Kurulumu"
GIT="Git Kurulumu"
DOCKER="Docker Seçimi"
APACHE2="Apache2 Kurulumu"
PHP="PHP Kurulumu"
NODEGOAT="Node Goat Penetrasyon Kurulumu"
LOGOUT="Sistem Çıkışı"

##########################################################################################
# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

##########################################################################################
echo -e "${CYAN}🚀 Kali Linux için Git ve Docker Kurulumu Başlıyor...${NC}"
chmod +x ./countdown.sh

##########################################################################################
# system_update
system_update() {
    sleep 2
    echo -e "\n###### ${SYSTEM} ######  "
    read -p "Sistemi Güncellemesi ister misiniz ? e/h " systemUpdateResult
    if [[ $systemUpdateResult == "e" || $systemUpdateResult == "E" ]]; then
        echo -e "Sistem Güncellemesi Kurulumu ..."

      # Sistem güncelleme
      echo -e "${YELLOW}🔄 Paket listesi güncelleniyor...${NC}"
      sudo apt update && apt-get upgrade -y

    else
        echo -e "Sistem Güncellemesi"
    fi
}
system_update

##########################################################################################
# Git
git_install() {
    sleep 2
    echo -e "\n###### ${GIT} ######  "
    read -p "Git Kurmak ister misiniz ? e/h " gitInstallResult
    if [[ $gitInstallResult == "e" || $gitInstallResult == "E" ]]; then
        echo -e "Git Kurulumu ..."
        ./countdown.sh
        echo -e "Git deployment ..."
        # Git Kurulumu
        echo -e "${BLUE}📂 Git yükleniyor...${NC}"
        sudo apt install git -y
        echo -e "${GREEN}✅ Git başarıyla yüklendi! Versiyon:${NC}"
        git --version
    else
        echo -e "Git Kurulmadı Kapatılmadı"
    fi
}
git_install

##########################################################################################
# Docker
docker_install() {
    sleep 2
    echo -e "\n###### ${DOCKER} ######  "
    read -p "Docker Kurmak ister misiniz ? e/h " dockerInstallResult
    if [[ $dockerInstallResult == "e" || $dockerInstallResult == "E" ]]; then
        echo -e "Docker Kurulumu ..."

      ./countdown.sh
      echo -e "Docker deployment ..."
      # Docker için eski versiyonları kaldır
      echo -e "${RED}🗑️ Eski Docker sürümleri kaldırılıyor...${NC}"
      sudo apt remove docker docker-engine docker.io containerd runc -y

      # Docker için gerekli bağımlılıkları yükle
      echo -e "${YELLOW}📦 Gerekli bağımlılıklar yükleniyor...${NC}"
      sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

      # Docker GPG anahtarını ekle
      echo -e "${CYAN}🔑 Docker GPG anahtarı ekleniyor...${NC}"
      curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

      # Docker Repository ekle
      echo -e "${BLUE}📜 Docker repository ekleniyor...${NC}"
      echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

      # Docker Kurulumu
      echo -e "${CYAN}🐳 Docker yükleniyor...${NC}"
      sudo apt update -y
      sudo apt install docker-ce docker-ce-cli containerd.io -y

      # Docker Kullanıcı Yetkisi
      echo -e "${GREEN}👤 Kullanıcı Docker grubuna ekleniyor...${NC}"
      sudo usermod -aG docker $USER

      echo -e "${GREEN}✅ Docker başarıyla yüklendi! Versiyon:${NC}"
      docker container run hello-world
      docker --version
    else
        echo -e "Docker Kurulmadı Kapatılmadı"
    fi
}
docker_install

##########################################################################################
# Apache2
apache2_install() {
    sleep 2
    echo -e "\n###### ${APACHE2} ######  "
    read -p "Apache2 Kurmak ister misiniz ? e/h " apache2Result
    if [[ $apache2Result == "e" || $apache2Result == "E" ]]; then
        echo -e "Apache2 Kurulumu ..."
        echo "🚀 Kali Linux için Apache2 Kurulumu Başlıyor..."

        # Sistem güncelleme
        echo "🔄 Paket listesi güncelleniyor..."
        sudo apt update -y

        #!/bin/bash

        echo "🚀 Kali Linux için Apache2 Kurulumu Başlıyor..."

        # Sistem güncelleniyor
        echo "🔄 Paket listesi güncelleniyor..."
        sudo apt update -y

        # Apache2 Kurulumu
        echo "📦 Apache2 yükleniyor..."
        sudo apt install apache2 -y

        # Apache2 Servisini Başlatma
        echo "🟢 Apache2 başlatılıyor..."
        sudo systemctl start apache2
        sudo systemctl enable apache2

        # Apache Çalışıyor mu Kontrol
        echo "🔎 Apache2 servis durumu kontrol ediliyor..."
        if systemctl is-active --quiet apache2; then
            echo "✅ Apache2 başarıyla çalışıyor!"
        else
            echo "❌ Apache2 başlatılamadı. Lütfen hata loglarını kontrol edin."
            exit 1
    fi

    # Varsayılan Web Sayfası Oluşturma
    echo "📝 Varsayılan web sayfası oluşturuluyor..."
    echo "<h1>Apache2 Sunucusu Başarıyla Kuruldu!</h1>" | sudo tee /var/www/html/index.html
    else
        echo -e "❌ Apache2 kurulmadı"
    fi
}
apache2_install

##########################################################################################
# PHP
php_install() {
    sleep 2
    echo -e "\n###### ${PHP} ######  "
    read -p "PHP Kurmak ister misiniz ? e/h " phpResult
    if [[ $phpResult == "e" || $phpResult == "E" ]]; then
        echo -e "PHP Kurulumu ..."
        # PHP Kurulumu
        echo "🐘 PHP yükleniyor..."
        sudo apt install php libapache2-mod-php -y

        # Apache2'yi Yeniden Başlatma
        echo "🔄 Apache2 yeniden başlatılıyor..."
        sudo systemctl restart apache2

        # PHP Test Sayfası Oluşturma
        echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

        # Kurulum Tamamlandı Mesajı
        echo "🎉 Apache2 ve PHP başarıyla kuruldu! Tarayıcıdan şu adresleri kontrol edin:"
        echo "👉 http://localhost (Ana Sayfa)"
        echo "👉 http://localhost/info.php (PHP Testi)"
        exit 0
    else
        echo -e "❌ Php Kurulmadı"
    fi
}
php_install

##########################################################################################
# NODEGOAT
nodegoat_install() {
    sleep 2
    echo -e "\n###### ${NODEGOAT} ######  "
    read -p "NodeGoat Kurmak ister misiniz ? e/h " nodeGoatResult
    if [[ $nodeGoatResult == "e" || $nodeGoatResult == "E" ]]; then
        echo -e "NodeGoat Kurulumu ..."
        ls -lar
        git clone https://github.com/OWASP/NodeGoat.git
        cd NodeGoat
        docker-compose up -d
        curl localhost:4000
        cd ..
    else
        echo -e "❌  NodeGoat Kurulmadı"
    fi
}
nodegoat_install

##########################################################################################
# logout
logout() {
    sleep 2
    echo -e "\n###### ${LOGOUT} ######  "
    read -p "Sistemi Kapatıp Tekrar Açmak ister misiniz ? e/h " logoutResult
    if [[ $logoutResult == "e" || $logoutResult == "E" ]]; then
        echo -e "Sistem Çıkışı ..."

    else
        echo -e "Sistem Kapatılmadı"
    fi
}
logout

##########################################################################################
echo -e "${RED}🔥 Git ve Docker başarıyla kuruldu! Sistemi yeniden başlatmanız gerekebilir. 🚀${NC}"
