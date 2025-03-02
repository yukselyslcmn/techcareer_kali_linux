#!/bin/bash


# chmod +x _02_kali_information.sh.
# sed -i -e 's/\r$//' _02_kali_information.sh
# ./_02_kali_information.sh.sh


# Eğer scriptin Windows'tan aktarıldıysa, satır sonları Windows (CRLF) formatında olabilir. Linux, LF (Line Feed) kullanır
# ve bu durum bad interpreter hatasına neden olabilir.
# Bash scriptini LF formatına çevirmek için aşağıdaki komutları kullan:

# 💡 Renk Kodları
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
NC="\e[0m"

echo -e "${GREEN}🚀 Kali Linux Optimizasyon Başlatılıyor...${NC}"

echo "=========================================="
echo "🔍 Kali Linux Ağ Bilgileri Toplama Scripti"
echo "=========================================="

# 1️- Hostname (Makine adı)
# `hostname` komutu, şu anki bilgisayarın adını (hostname) döndürür.
# Eğer makine bir ağa bağlıysa, ağ üzerindeki adını da öğrenebilirsiniz.
hostname
sudo hostname hamitmizrak_hostname
echo -e "${YELLOW}🚀\n🖥️ Hostname (Makine Adı):${NC}"
hostname

# 2️- Domain Adı (Eğer bir domain bağlıysa)
# `domainname` komutu, sistemin bir domain'e bağlı olup olmadığını kontrol eder.
# Eğer bir domain'e bağlı değilse, çıktı "none" olabilir.
domainname
echo -e "${YELLOW}🚀\n🌐 Domain Adı:${NC}"
sudo domainname hamitmizrak_domain
domainname

# 3️- IP Adresi (Yerel ve Dış IP)
# `hostname -I` → Yerel IP adresini döndürür (LAN IP, yani iç ağ IP adresi).
# `curl -s ifconfig.me` → Dış IP adresini (WAN IP) almak için ifconfig.me servisini kullanır.
echo -e "${YELLOW}🚀\n📡 IP Adresi:${NC}"
echo "🔹 Yerel IP (LAN): $(hostname -I)"
echo "🔹 Dış IP (WAN): $(curl -s ifconfig.me)"  # İnternet üzerindeki IP adresimizi öğrenir.

# 4️-Ağ Arayüzleri ve IP Adresleri
# `ip -4 a` → Sisteminizde bulunan tüm ağ arayüzlerini ve bunlara atanmış IPv4 adreslerini listeler.
# `grep "inet"` → "inet" ifadesi içeren satırları alır (IPv4 adreslerini gösterir).
# `awk '{print $2, $7}'` → IP adreslerini ve bağlı olduğu arayüzleri listeler.
echo -e "\n🌍 ${YELLOW}🚀Ağ Arayüzleri ve IP Adresleri:${NC}"
ip -4 a | grep "inet" | awk '{print $2, $7}'

# 5️-DNS Sunucuları
# `/etc/resolv.conf` dosyası, sistemin hangi DNS sunucularını kullandığını içerir.
# `grep "nameserver"` → Sadece "nameserver" satırlarını alır.
# `awk '{print $2}'` → Sadece IP adreslerini çıkartır.
echo -e "\n📌 ${YELLOW}🚀 DNS Sunucuları:${NC}"
cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}'

# 6️-Varsayılan Ağ Geçidi (Gateway)
# `ip route` → Ağ rotalarını listeler.
# `grep default` → Varsayılan gateway’i içeren satırı bulur.
# `awk '{print $3}'` → Gateway adresini çıkartır.
echo -e "\n🚪 ${YELLOW}🚀Varsayılan Ağ Geçidi (Gateway):${NC}"
ip route | grep default | awk '{print $3}'

# 7️- MAC Adresi (Fiziksel Ağ Kartı Adresi)
# `ip link show` → Ağ arayüzleriyle ilgili detaylı bilgileri gösterir.
# `grep "link/ether"` → Sadece MAC adresini içeren satırları seçer.
# `awk '{print $2}'` → Sadece MAC adresini gösterir.
echo -e "\n🔑 ${YELLOW}🚀 MAC Adresi:${NC}"
ip link show | grep "link/ether" | awk '{print $2}'

# 8️-Aktif Bağlantılar (Hangi portlar açık?)
# `ss -tulnp` → Açık portları ve bağlantıları gösterir.
# - `-t` → TCP bağlantılarını gösterir.
# - `-u` → UDP bağlantılarını gösterir.
# - `-l` → Dinleme yapan (listening) portları gösterir.
# - `-n` → Host adlarını çözümlemez, sadece IP gösterir.
# - `-p` → Hangi programın (process) portu kullandığını gösterir.
echo -e "\n🔌 ${YELLOW}🚀Aktif Bağlantılar (Açık Portlar ve Servisler):${NC}"
ss -tulnp

echo -e "\n✅ ${YELLOW}🚀İşlem Tamamlandı!${NC}"
