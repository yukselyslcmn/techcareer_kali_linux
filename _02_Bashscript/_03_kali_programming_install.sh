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

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}🚀 Kali Linux için Git ve Docker Kurulumu Başlıyor...${NC}"

# Sistem güncelleme
echo -e "${YELLOW}🔄 Paket listesi güncelleniyor...${NC}"
sudo apt update -y

##########################################################################################
git_install(){
  # Git Kurulumu
  echo -e "${BLUE}📂 Git yükleniyor...${NC}"
  sudo apt install git -y
  echo -e "${GREEN}✅ Git başarıyla yüklendi! Versiyon:${NC}"
  git --version
}
git_install

##########################################################################################
docker_install(){
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
docker --version
}
docker_install

##########################################################################################
echo -e "${RED}🔥 Git ve Docker başarıyla kuruldu! Sistemi yeniden başlatmanız gerekebilir. 🚀${NC}"
