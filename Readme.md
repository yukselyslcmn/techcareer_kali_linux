

# ⚠️ Sorumluluk Reddi Beyanı (Disclaimer)

Bu eğitim, **Kali Linux** ve siber güvenlik araçlarının **yasal ve etik kullanımı** konusunda bilgi vermek amacıyla hazırlanmıştır. Eğitim süresince anlatılan tüm teknikler ve araçlar, yalnızca **eğitim, araştırma ve siber güvenlik farkındalığını artırma** amacıyla kullanılmalıdır.

**❗ Önemli:**
- Eğitimde anlatılan yöntemlerin **kötüye kullanımı**, yetkisiz sistemlere erişim sağlamak veya herhangi bir yasa dışı faaliyet için kullanılması **kesinlikle yasaktır**.
- Katılımcılar, öğrendikleri bilgileri yalnızca **kendi sorumlulukları** altında kullanmalıdır.
- Eğitmen ve eğitim platformu, katılımcıların bu bilgileri nasıl kullandığından **sorumlu değildir**.

Unutmayın: **Siber güvenlik bir savunma sanatıdır, saldırı aracı değil!**

**📌 Yasal Uyarı:**  
Herhangi bir etik dışı veya yasa dışı kullanım, ilgili ülkenin yasalarına göre suç teşkil edebilir ve ciddi yaptırımlara neden olabilir. Bu eğitime katılan herkes, öğrendiği bilgileri yalnızca **yasal sınırlar içinde kullanacağını** kabul etmiş sayılır.

🔹 **Hacklemek değil, güvenliği sağlamak için öğreniyoruz.**  
🔹 **Sorumluluk tamamen kullanıcıya aittir.**
---

# Etic Hack(Syber Security)
[GitHub Link](https://github.com/hamitmizrak/techcareer_kali_linux.git)
---

## Docker Codes
```sh 
docker ps

docker-compose up
docker-compose up -d

docker-compose down
```
---

## Windows on Docker with Kali Linux (1.YOL)
```sh 
docker pull kalilinux/kali-rolling
docker container run -d -p 2222:22 --name kali_container_manuel kalilinux/kali-rolling
```
---

## Dikkattttt (Docker)
```sh 
docker-compose.yml dosyasını çalıştırırken eğer "Git bash Here" ile çalıştırırsanız hata alabilirsiniz.
```
---


## Windowsta Docker Kurulu olduğundan Emin olunuz
```sh 
$ docker --version
$ sudo apt update
$ sudo apt install docker.io -y
$ sudo systemctl enable --now docker
$ sudo systemctl start docker
$ sudo systemctl status docker
$ sudo systemctl enable docker
$ sudo systemctl restart docker

$ Docker: Yeni IP Almak
$ docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kali_container

Yukarıdaki Komutla docker container üzerienden SSHb bağlanmayı sağlayacak
```
---



##  Windows on Docker with Kali Linux (2.YOL)
```sh 
ls -lar
docker ps

docker-compose up
docker-compose up -d

docker exec -it kali_container /bin/bash
docker exec -it kali_container /bin/sh

$ apt update && apt upgrade -y
$ dpkg -l | grep openssh-server
$ apt update && apt install -y openssh-server
$ service ssh start
$ systemctl enable ssh
$ dpkg -l | grep openssh-server

$ apt install -y kali-linux-default kali-linux-headless sudo wget vim net-tools nmap
$ ENTER
$ TURKISH FONT          =>  14  =>  ENTER
$ MAC ADDRESS           =>  no  =>  ENTER (Her Ağ bağlantısında yeni bir MAC adress olsun) Siber güvenlik testi için anonimlik
$ KISMET                =>  yes =>  ENTER (Wİ-Fİ ağlarını analiz etmek, kablosuz ağları keşmet içindir) Güvenli ve Kısıtlı mod istemiyorsak
$ KISMET GROUP          =>  ENTER    (Kablosuz ağ analizileri için özel yetkilere ihtiyac duyulan araçtır, eğer root isek)
$ CAPTURE PACKET        =>  yes => WireShark için (Eğer tek kullanıcıysak)
$ 1-INETD, 2-STANDALONE =>  2   => (SSLH[Aynı port üzerinden SSH, HTTPS, OpenVPN vb gibi servisleri yönlendirmek ])

$ service ssh start  #(Starting OpenBSD Secure Shell server: sshd.)
$ passwd root  # Root güçlü parola veriniz, ancak ben eğitimde olduğum için root vereceğim.
$ root         #
$ systemctl enable ssh

$ vim /etc/ssh/sshd_config
22 
PermitRootLogin yes
PasswordAuthentication yes


Dikkat: IP bulmak istiyorsak, docker-desktop > Container > Inspect > Networks > IP ÖĞREN
$ ssh root@172.19.0.2 -p 22   (1.SEÇENEK)
$ ssh root@localhost -p 22    (2.SEÇENEK)
$ ssh root@localhost -p 2222  (3.SEÇENEK)
$ fingerprint => yes
$ root@localhost's password: (root) 
$ systemctl enable ssh
```
---


## Windows on Docker with Kali Linux (Terminal Komutları)
```sh 

Dosya ve Dizin İşlemlerinde
+++++++++++++++++++++++++++
$ ls -la
$ ls -lar
$ cd /var/log
$ mkdir test
$ rmdir -rf test

Dosya ve Dizin İşlemlerinde
+++++++++++++++++++++++++++ 
$ whoami         # Hangi kullanıcıyla bağlandığınız görünüz
$ adduser hamit  # Yeni bir kullanıcı Ekle
$ passwd  hamit  # Kullanıcıya Şifre belirle
$ usermod -aG sudo hamit # hamit kullanıcıya sudo yetkisi vermek

Servis Yönetimi
+++++++++++++++++++++++++++ 
$ service ssh status  # SSH servisi çalışıyor mu kontrol et
$ service apache2 start  # Web sunucusunu başlat
$ systemctl restart networking  # Ağ servisini yeniden başlat

Ağ Analizi ve Güvenlik Testleri
+++++++++++++++++++++++++++ 
$ ifconfig      # Ağ arayüzlerini görüntüle
$ nmap -sV 127.0.0.1  # Port taraması yap
$ tcpdump -i eth0  # Ağ trafiğini dinle

Paket Yükleme ve Güncelleme
+++++++++++++++++++++++++++ 
$ apt update && apt upgrade -y  # Sistemi güncelle
$ apt install wireshark -y  # Wireshark yükle
$ apt remove apache2 -y  # Apache'yi kaldır


Docker Kali-Linux da  UI ile çalışmak isterseniz 
+++++++++++++++++++++++++++ 
Kali Linux GUI kullanmak istersen, Xrdp veya VNC kurabilirsin:
$ apt install -y xfce4 xfce4-goodies xrdp
$ service xrdp start
# Daha sonra Windows üzerinden Remote Desktop Connection (mstsc) ile bağlanabilirsin.

```
---


## TLS
```sh 

```
---

### **TLS (Transport Layer Security) Nedir?**
**TLS (Transport Layer Security)**, internet üzerinden güvenli iletişimi sağlamak için kullanılan bir **kriptografik protokoldür**. İnternet üzerindeki verilerin **gizliliğini, bütünlüğünü ve kimlik doğrulamasını** sağlayarak, saldırılara karşı koruma sunar.

---

## **1. TLS Ne İşe Yarar?**
TLS, özellikle **web tarayıcıları ve sunucular** arasındaki iletişimde, e-postalarda, VoIP (sesli iletişim), mesajlaşma ve VPN gibi birçok farklı uygulamada kullanılır. **HTTPS (HTTP Secure)** protokolü de aslında **HTTP + TLS** kombinasyonudur.

TLS, şu üç temel güvenlik fonksiyonunu sağlar:

1. **Şifreleme (Encryption)** – Verilerin üçüncü taraflarca okunmasını engeller.
2. **Kimlik Doğrulama (Authentication)** – Karşı tarafın gerçek olup olmadığını doğrular (Örneğin, bir web sitesinin sahte olup olmadığını anlamak için).
3. **Bütünlük (Integrity)** – Verilerin iletim sırasında değiştirilmediğini garantiler.

---

## **2. TLS Nasıl Çalışır? (Handshake Süreci)**
TLS, istemci (örneğin bir web tarayıcısı) ve sunucu arasında güvenli bir bağlantı kurmak için **TLS Handshake** adı verilen bir süreçten geçer:

1. **İstemci, sunucuya "Merhaba" (ClientHello) der:** Desteklediği şifreleme algoritmalarını ve diğer bilgileri gönderir.
2. **Sunucu yanıt verir (ServerHello):** Kullanılacak şifreleme algoritmasını belirler ve kendi sertifikasını (SSL/TLS sertifikası) gönderir.
3. **İstemci, sertifikayı doğrular:** Sertifika geçerliyse, istemci bir anahtar oluşturur ve sunucuya güvenli şekilde iletir.
4. **Şifreli iletişim başlar:** Artık iki taraf da ortak bir şifreleme anahtarı kullanarak güvenli veri iletişimi yapar.

---

## **3. TLS ve SSL Farkı Nedir?**
**SSL (Secure Sockets Layer)**, TLS'in eski versiyonudur. SSL 2.0 ve 3.0 sürümleri güvenlik açıkları nedeniyle kullanımdan kaldırılmıştır. Günümüzde **TLS 1.2 ve TLS 1.3** sürümleri aktif olarak kullanılmaktadır.

### **SSL vs TLS Karşılaştırması:**
| Özellik       | SSL | TLS |
|--------------|-----|-----|
| İlk Çıkış Tarihi | 1995 | 1999 |
| Kullanım Durumu | Eski ve güvensiz | Modern ve güvenli |
| Güncel Versiyon | SSL 3.0 (Desteklenmiyor) | TLS 1.2 / TLS 1.3 |
| Hız ve Performans | Daha yavaş | Daha hızlı, düşük gecikme süresi |
| Güvenlik Açıkları | Poodle, BEAST gibi zafiyetler içerir | Daha güvenli |

Günümüzde **SSL yerine TLS kullanılması önerilir.** Tarayıcılar ve sunucular artık SSL'i desteklememektedir.

---

## **4. TLS 1.2 ve TLS 1.3 Arasındaki Farklar**
Şu anda en güncel ve güvenli TLS sürümü **TLS 1.3**'tür. **TLS 1.2'ye göre daha hızlı ve güvenlidir.**

| Özellik       | TLS 1.2 | TLS 1.3 |
|--------------|--------|--------|
| Handshake Süresi | Daha uzun | Daha hızlı |
| Şifreleme Algoritmaları | RSA, AES, SHA vb. | Daha güçlü algoritmalar |
| Güvenlik Açıkları | Daha fazla | Daha güvenli |

TLS 1.3, özellikle **daha az el sıkışma süreci ve modern kriptografi algoritmaları** ile performans ve güvenlik açısından büyük iyileştirmeler getirir.

---

## **5. TLS Nerelerde Kullanılır?**
TLS, internet üzerindeki birçok farklı alanda güvenliği sağlamak için kullanılır:

- **Web Siteleri (HTTPS)**
- **E-posta İletişimi (SMTP, IMAP, POP3)**
- **VPN ve Uzak Bağlantılar**
- **VoIP (Sesli Aramalar)**
- **Mesajlaşma Uygulamaları (WhatsApp, Signal, Telegram gibi)**
- **Online Ödemeler ve Bankacılık Sistemleri**

---

## **6. TLS Güvenlik Açıkları ve Saldırı Türleri**
Her ne kadar TLS güvenliği sağlasa da, yanlış yapılandırma ve eski sürümlerin kullanımı bazı saldırılara yol açabilir:

- **Man-in-the-Middle (MitM) Saldırısı**: Saldırgan, istemci ve sunucu arasındaki iletişimi keserek verileri okuyabilir.
- **TLS Stripping**: HTTP'yi zorla kullanarak HTTPS bağlantısını devre dışı bırakabilir.
- **POODLE Saldırısı**: Eski SSL 3.0 protokolünü kullanan sistemleri hedef alır.
- **Downgrade Saldırıları**: Güvenli TLS 1.3 yerine zayıf TLS 1.0/1.1’e düşürerek saldırıları mümkün kılar.

### **Güvenliği Sağlamak İçin Yapılması Gerekenler**
✔ **TLS 1.3 veya en azından TLS 1.2 kullanın**  
✔ **Zayıf şifreleme algoritmalarını devre dışı bırakın**  
✔ **Geçerli bir SSL/TLS sertifikası kullanın**  
✔ **HTTP yerine HTTPS zorunlu hale getirin**  
✔ **HSTS (HTTP Strict Transport Security) kullanın**

---

## **Sonuç**
TLS, internet üzerindeki **güvenli iletişimin temel taşıdır**. Günümüzde, güvenliği sağlamak için **SSL yerine TLS 1.2 ve TLS 1.3 kullanımı** önerilir. Web siteleri, e-posta servisleri, VPN bağlantıları ve finansal işlemler gibi birçok kritik alanda kullanılır.

**Kısacası, TLS internet dünyasında güvenliğin olmazsa olmazıdır!** 🚀



## VPN (Virtual Private Network)
```sh 

```
---
# **VPN (Virtual Private Network) Nedir? – Detaylı Açıklama**
VPN, yani **"Virtual Private Network" (Sanal Özel Ağ)**, **internet üzerindeki bağlantınızı şifreleyerek** güvenli ve anonim bir şekilde internete erişmenizi sağlayan bir teknolojidir. VPN, cihazınız ile hedef sunucu arasında **şifreli bir tünel** oluşturarak, verilerinizi korur ve sizi izlenmeye karşı anonim hale getirir.

---

## **1. VPN’in Temel Çalışma Mantığı**
VPN, cihazınız ile **VPN sunucusu** arasında **şifreli bir bağlantı (tünel)** kurar. Bu tünel sayesinde:
- İnternete **farklı bir IP adresiyle bağlanırsınız** (VPN sunucusunun IP adresini kullanırsınız).
- **Bağlantınız şifrelenir**, böylece internet servis sağlayıcınız (ISP), hükümetler, hacker’lar veya kötü niyetli kişiler **veri trafiğinizi göremez**.
- **Sansürleri ve bölgesel kısıtlamaları aşabilirsiniz**, çünkü VPN ile farklı bir ülkedeymiş gibi gözükebilirsiniz.

---

## **2. VPN Kullanım Alanları**
VPN, birçok farklı amaç için kullanılabilir:

### **🔐 2.1. Güvenlik ve Şifreleme**
- VPN, **veri trafiğinizi şifreleyerek** internet bağlantınızı güvenli hale getirir.
- Özellikle **Wi-Fi ağlarında** (havalimanı, kafe, otel gibi) **hacker saldırılarından korunmanızı** sağlar.
- **Şirketler**, çalışanlarının **uzaktan güvenli bir şekilde** şirket ağına bağlanmasını sağlamak için VPN kullanır.

### **🕵️‍♂️ 2.2. Anonimlik ve Gizlilik**
- VPN, **gerçek IP adresinizi gizler**, böylece internet servis sağlayıcınız veya diğer web siteleri sizi takip edemez.
- **Hükümetlerin internet takip politikalarından korunmak için** VPN kullanılır.
- **Tor ağı ile birlikte kullanıldığında**, tam anonimlik sağlar.

### **🌍 2.3. Sansürleri ve Coğrafi Engelleri Aşma**
- VPN, **Netflix, Disney+, Hulu gibi platformlardaki bölgesel içerik kısıtlamalarını aşmanıza** olanak tanır.
- Örneğin, **ABD’de bulunan bir VPN sunucusuna bağlanarak** yalnızca ABD’de izlenebilen içeriklere erişebilirsiniz.
- **Çin, İran, Rusya gibi ülkelerde internet sansürünü aşmak** için VPN kullanılır.

### **🎮 2.4. Oyun ve Ping Süresini Azaltma**
- VPN, bazı oyunlarda **daha düşük ping süresi** sağlayarak daha hızlı bağlantı sunabilir.
- **IP yasaklarını aşmanıza** yardımcı olabilir.
- **Oyunlarda DDoS saldırılarından korunmak için** kullanılabilir.

### **💻 2.5. İş Yerleri İçin Uzak Bağlantı**
- Şirketler, çalışanlarının **uzaktan güvenli bir şekilde şirket ağına bağlanmasını sağlamak için** VPN kullanır.
- VPN ile çalışanlar, **şirketin iç ağındaki dosyalara ve sistemlere** dışarıdan erişebilir.

---

## **3. VPN Nasıl Çalışır?**
VPN’in çalışma prensibi **şifreleme ve tünelleme protokollerine** dayanır.

1️⃣ **Cihazınız (Bilgisayar, Telefon, Tablet, Router) VPN istemcisine bağlanır.**  
2️⃣ **VPN, internet trafiğinizi şifreler.**  
3️⃣ **VPN sunucusu, trafiğinizi alır ve internete yönlendirir.**  
4️⃣ **Web siteleri ve diğer hizmetler, sizin VPN sunucusunun IP adresiyle bağlandığınızı görür.**

Örneğin:
- **Normal internet bağlantısı:**
  ```
  Cihazınız → İnternet Servis Sağlayıcınız (ISP) → Web Sitesi
  ```
  Bu durumda, ISP’niz tüm verilerinizi görebilir.

- **VPN kullanıldığında:**
  ```
  Cihazınız → Şifreli VPN Tüneli → VPN Sunucusu → Web Sitesi
  ```
  ISP ve dış gözlemciler, yalnızca **VPN sunucusuna bağlandığınızı görebilir**, ama içerik şifreli olduğu için verilerinizi okuyamaz.

---

## **4. VPN Türleri**
### **4.1. Kişisel VPN (Consumer VPN)**
- **NordVPN, ExpressVPN, Surfshark, ProtonVPN, Mullvad gibi servisler** kişisel kullanıcılar için VPN hizmeti sunar.
- **Anonimlik, gizlilik ve sansürü aşmak için** kullanılır.

### **4.2. Kurumsal VPN (Corporate VPN)**
- Şirketler, çalışanlarının **uzaktan şirket ağına güvenli şekilde bağlanmasını sağlamak için** VPN kullanır.
- **Cisco AnyConnect, Fortinet VPN, Palo Alto GlobalProtect gibi çözümler** yaygındır.

### **4.3. Site-to-Site VPN**
- Farklı lokasyonlardaki **şirket ağlarını güvenli bir şekilde birbirine bağlar**.
- Genellikle büyük şirketler ve kurumlar kullanır.

---

## **5. VPN Protokolleri (Şifreleme ve Güvenlik)**
VPN bağlantısında farklı **şifreleme ve tünelleme protokolleri** kullanılır:

| Protokol | Açıklama |
|----------|----------|
| **OpenVPN** | En yaygın, açık kaynaklı, güvenli ve hızlı protokol. |
| **WireGuard** | Yeni nesil, daha hızlı, daha güvenli ve daha hafif bir protokol. |
| **IKEv2/IPSec** | Mobil cihazlar için iyi, hızlı bağlantı sağlar. |
| **L2TP/IPSec** | Eski ama güvenli bir protokol. |
| **PPTP** | Çok eski, ama **zayıf güvenlik nedeniyle önerilmez**. |

---

## **6. VPN Kullanırken Dikkat Edilmesi Gerekenler**
- **Ücretsiz VPN’lerden kaçının!**  
  (Çoğu ücretsiz VPN, **veri satışı yapar, yavaş ve güvenli değildir**.)
- **Güvenilir ve log tutmayan VPN sağlayıcılarını tercih edin.**  
  (Örn: **Mullvad, ProtonVPN, IVPN, NordVPN, ExpressVPN**)
- **VPN’in hangi protokolü kullandığını kontrol edin.**  
  (Örn: **WireGuard veya OpenVPN önerilir**.)
- **VPN'in sızıntı yapmadığını kontrol edin (IP, DNS, WebRTC Leak Testi).**
  - Test için: [https://ipleak.net/](https://ipleak.net/)
- **Kill Switch kullanın.**
  - VPN bağlantısı koptuğunda **internet bağlantınızı keserek** anonim kalmanızı sağlar.

---

## **7. VPN Kullanmanın Dezavantajları**
- **İnternet Hızını Azaltabilir:** VPN bağlantıları **ekstra şifreleme** ve **tünelleme nedeniyle** internet hızınızı düşürebilir.
- **Bazı Siteler VPN Kullanımını Engelleyebilir:** Netflix, PayPal, bazı bankalar VPN trafiğini engelleyebilir.
- **Kalitesiz VPN Servisleri Veri Toplayabilir:** Ücretsiz veya kötü niyetli VPN sağlayıcıları, **verilerinizi saklayabilir ve satabilir**.
- **Bazı Ülkelerde VPN Kullanımı Yasak Olabilir:** Çin, Rusya, Kuzey Kore, İran gibi ülkelerde VPN kullanımı **sınırlıdır veya yasaktır**.

---

## **8. Sonuç**
🔹 **VPN, internet güvenliği, gizlilik ve sansürü aşmak için güçlü bir araçtır.**  
🔹 **Doğru protokol ve güvenilir bir sağlayıcı kullanıldığında** VPN, veri güvenliğinizi artırır.  
🔹 **Özellikle hacker saldırılarından korunmak, IP adresinizi gizlemek ve yasaklı içeriklere erişmek için** VPN oldukça faydalıdır.

⚠️ **Ancak kötü VPN seçimleri verilerinizi riske atabilir!** Bu yüzden **ücretsiz ve güvenilir olmayan VPN servislerinden kaçının.**


## Try-Hack-Me Sitesi (https://tryhackme.com/)
```sh 

```
---
# **TryHackMe Nedir? – Detaylı İnceleme**
[TryHackMe](https://tryhackme.com/) **siber güvenlik eğitimi ve etik hacking** üzerine yoğunlaşmış, interaktif ve uygulamalı öğrenme ortamı sunan bir platformdur. Siber güvenlik alanına yeni başlayanlardan ileri düzey kullanıcılara kadar herkes için çeşitli eğitim modülleri, CTF (Capture The Flag) senaryoları ve gerçek dünya saldırı simülasyonları sunar.

---

## **1. TryHackMe'nin Amacı ve Kullanım Alanları**
TryHackMe, **siber güvenlik eğitimi** almak isteyen herkes için tasarlanmış bir platformdur. Temel amacı:
- Kullanıcılara **hızlı, pratik ve etkileşimli** bir şekilde siber güvenlik öğretmek.
- Gerçek dünya saldırılarını **laboratuvar ortamında deneyimleme** fırsatı sunmak.
- **Siber güvenlik kariyerine başlamak isteyenlere** rehberlik etmek.
- **Etik hackerlık, ağ güvenliği, penetrasyon testi ve adli bilişim (forensics) gibi konular** üzerine uygulamalı eğitimler sağlamak.

---

## **2. TryHackMe'nin Temel Özellikleri**
### **🖥️ 2.1. Uygulamalı Sanal Laboratuvarlar**
- Kullanıcılar, tarayıcı üzerinden **bulut tabanlı sanal makineleri (VM)** kullanarak gerçek zamanlı olarak hacking senaryolarını deneyimleyebilir.
- Kali Linux, Windows, Metasploitable gibi sistemler üzerinde çalışmalar yapabilirsiniz.
- Sanal makineleri **kendi sisteminize indirmeye gerek olmadan** direkt olarak web tarayıcınızdan kullanabilirsiniz.

### **📚 2.2. Modüler Eğitim Sistemi (Rooms)**
- TryHackMe, "Rooms" adı verilen odalara sahiptir. Her oda, belirli bir güvenlik konusuna odaklanır.
- Odalar, **temel ve ileri düzey konulara göre sıralanmıştır**.
- Kullanıcılar odaları tamamlayarak puan kazanır ve seviyelerini yükseltir.

### **🎯 2.3. CTF (Capture The Flag) Yarışmaları**
- TryHackMe üzerinde **CTF yarışmaları düzenlenir** ve kullanıcılar bayrak (flag) avına çıkar.
- **Flag Formatı** genellikle şu şekildedir:
  ```
  THM{örnek_flag}
  ```
- Kullanıcılar belirli sistemlerde zafiyetleri bulup, exploit ederek bayrakları ele geçirmeye çalışır.

### **🛡️ 2.4. Hacking & Siber Güvenlik Alanında Geniş Kapsamlı Konular**
- **Penetrasyon Testi (Pentesting)**
- **Web Uygulama Güvenliği**
- **Ağ Güvenliği**
- **Adli Bilişim (Forensics)**
- **Red Team & Blue Team**
- **Kötü Amaçlı Yazılım Analizi (Malware Analysis)**
- **Güvenlik Araçları (Metasploit, Burp Suite, Wireshark, Nmap vb.)**
- **Sosyal Mühendislik**
- **Kriptografi**
- **Zafiyet Analizi**
- **Active Directory ve İç Ağı Hackleme**

---

## **3. TryHackMe İçerisindeki Popüler Modüller (Rooms)**
Aşağıda, TryHackMe’de en çok tercih edilen bazı popüler modüller (Rooms) listelenmiştir:

| Modül Adı | Açıklama |
|-----------|---------|
| **Kali Linux Fundamentals** | Kali Linux'un temel kullanımı ve araçları. |
| **Introduction to Pentesting** | Pentesting sürecine giriş, temel teknikler. |
| **Nmap** | Ağ taraması ve zafiyet keşfi için Nmap eğitimi. |
| **Burp Suite Basics** | Web güvenlik testleri için Burp Suite kullanımı. |
| **Metasploit** | Exploit geliştirme ve saldırı senaryoları. |
| **Privilege Escalation** | Linux ve Windows'ta yetki yükseltme teknikleri. |
| **Active Directory Basics** | Active Directory yapısını anlama ve saldırılar. |
| **Web Exploitation** | XSS, SQL Injection, SSRF, CSRF gibi web saldırıları. |

---

## **4. TryHackMe Üyelik Türleri**
TryHackMe iki farklı üyelik modeline sahiptir:

| Üyelik Türü | Açıklama |
|-------------|---------|
| **Ücretsiz (Free)** | Temel odalara erişim sağlar. Kısıtlı sanal makine süresi içerir. |
| **Premium (Aylık/Yıllık Ücretli)** | Tüm içeriklere erişim, sınırsız sanal makine kullanımı ve ekstra eğitim materyalleri içerir. |

**Premium üyelik avantajları:**
- Sınırsız sanal makine süresi.
- Sadece premium kullanıcılara özel ileri düzey odalar.
- TryHackMe sertifikalarına erişim.

---

## **5. TryHackMe'nin Avantajları**
✅ **Başlangıç seviyesi için uygun**: Yeni başlayanlar için rehberli ve anlaşılır içerikler sunar.  
✅ **Uygulamalı eğitim imkanı**: Sanal makineler sayesinde gerçek senaryolar üzerinde çalışabilirsiniz.  
✅ **CTF yarışmaları**: Gerçek dünya saldırılarını öğrenmek için eğlenceli görevler içerir.  
✅ **Red Team & Blue Team eğitimi**: Hem saldırı (offensive) hem de savunma (defensive) stratejilerini öğretir.  
✅ **Ağ, web güvenliği ve sızma testleri** gibi birçok konuda derinlemesine bilgi edinme imkanı sunar.  
✅ **Sertifika programları** ile kariyerinize katkı sağlayabilirsiniz.

---

## **6. TryHackMe'nin Dezavantajları**
❌ **Ücretsiz hesap ile tüm içeriklere erişilemez**, premium üyelik gereklidir.  
❌ **İleri düzey exploit geliştirme konularında eksiklikler olabilir**.  
❌ **Bazı eğitimler eski zafiyetleri temel alabilir**, ancak temel mantığı anlamak için yine de faydalıdır.

---

## **7. TryHackMe vs Hack The Box (HTB) Karşılaştırması**
**TryHackMe** ve **Hack The Box (HTB)**, siber güvenlik eğitimi için kullanılan iki popüler platformdur.

| Karşılaştırma | TryHackMe | Hack The Box (HTB) |
|--------------|----------|------------------|
| **Başlangıç Seviyesi İçin Uygunluk** | ✅ Evet, çok uygundur. | ❌ Daha zor, ileri seviye gerektirir. |
| **Eğitim Yapısı** | Modüler, rehberli eğitimler sunar. | Rehberli içerikler sınırlıdır. |
| **Uygulamalı Öğrenme** | Sanal makinelerle doğrudan çalışabilirsiniz. | Sanal makineler manuel olarak bağlanır. |
| **Ücretsiz İçerik** | Temel seviyede ücretsiz içerikler var. | Bazı makineler ücretsizdir, ancak rehber içerikler genellikle ücretlidir. |
| **Zorluk Seviyesi** | Kolaydan zora doğru ilerler. | Orta ve ileri seviye kullanıcılar için daha uygundur. |
| **Red Team / Blue Team İçerik** | Hem saldırı hem savunma içerikleri sunar. | Genellikle saldırı odaklıdır. |

**Sonuç:** **Başlangıç seviyesindeyseniz TryHackMe, ileri seviyedeyseniz Hack The Box daha iyi bir seçenek olabilir.**

---

## **8. Sonuç**
TryHackMe, **siber güvenlik öğrenmek isteyen herkes için harika bir başlangıç noktasıdır.**
- **Eğitici, rehberli içerikler**, yeni başlayanların hacking dünyasını anlamasına yardımcı olur.
- **CTF yarışmaları ve gerçek dünya senaryoları**, pratik yaparak gelişmeyi sağlar.
- **İleri seviye eğitimler**, penetrasyon testi ve siber güvenlik kariyeri için sağlam bir temel oluşturur.

🚀 Eğer **siber güvenliğe ilginiz varsa, TryHackMe kesinlikle denemeniz gereken bir platformdur!**

## ifconfig(Eskidi)
```sh 

```
---
### **`ifconfig` Komutu ve Çıktısının Detaylı Açıklaması**
`ifconfig` komutu, Linux sistemlerinde ağ arayüzleri hakkında bilgi almak ve yönetmek için kullanılır. Bu komut ile ağ kartlarınızın (Ethernet, Wi-Fi, Loopback vb.) detaylarını görebilirsiniz.

---

## **Örnek `ifconfig` Çıktısı ve Açıklaması**
```bash
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
      inet 192.168.1.100  netmask 255.255.255.0  broadcast 192.168.1.255
      inet6 fe80::1a2b:3c4d:5e6f:7g8h  prefixlen 64  scopeid 0x20<link>
      ether 00:1a:2b:3c:4d:5e  txqueuelen 1000  (Ethernet)
      RX packets 12500  bytes 1002300 (1.0 MB)
      RX errors 0  dropped 0  overruns 0  frame 0
      TX packets 8300  bytes 750400 (750.4 KB)
      TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

---

## **1. Arayüz Adı (eth0, wlan0, lo vb.)**
- **`eth0`** → İlk kablolu ağ arayüzü. (Ethernet bağlantısı)
- **`wlan0`** → İlk kablosuz ağ arayüzü. (Wi-Fi bağlantısı)
- **`lo`** → Loopback arayüzü (127.0.0.1 - Yerel sistem bağlantısı)

---

## **2. `flags` (Arayüz Durumu ve Özellikleri)**
Bu kısım, arayüzün durumunu ve desteklediği özellikleri gösterir.

**Örnek:**
```bash
flags=4163<UP,BROADCAST,RUNNING,MULTICAST>
```
- **`UP`** → Arayüz etkin durumda.
- **`BROADCAST`** → Geniş yayın (broadcast) destekliyor.
- **`RUNNING`** → Fiziksel bağlantı aktif.
- **`MULTICAST`** → Çok noktaya yayın (multicast) destekliyor.

---

## **3. `mtu` (Maksimum İletim Birimi)**
- **Örnek:** `mtu 1500`
- MTU (Maximum Transmission Unit), bir paketin maksimum boyutunu belirtir.
- **1500 bayt** genellikle Ethernet ağlarında kullanılan standart değerdir.
- Daha büyük MTU, daha az paket başlığı ile daha fazla veri taşır, ancak parçalanma riski artar.

---
/home/kali/Downloads/pythonsoftware.ovpn/home/kali/Downloads/pythonsoftware.ovpn
## **4. IPv4 Adresi (`inet`)**
```bash
inet 192.168.1.100  netmask 255.255.255.0  broadcast 192.168.1.255
```
- **`inet 192.168.1.100`** → Bu cihazın IPv4 adresi.
- **`netmask 255.255.255.0`** → Alt ağ maskesi.
    - **255.255.255.0** → 192.168.1.0/24 ağında olduğunu gösterir (256 adres içerir).
- **`broadcast 192.168.1.255`** → Ağdaki tüm cihazlara yayın yapmak için kullanılan adres.

---

## **5. IPv6 Adresi (`inet6`)**
```bash
inet6 fe80::1a2b:3c4d:5e6f:7g8h  prefixlen 64  scopeid 0x20<link>
```
- **`inet6 fe80::1a2b:3c4d:5e6f:7g8h`** → Cihazın IPv6 adresi.
- **`prefixlen 64`** → Alt ağ uzunluğu (IPv4'teki netmask gibi).
- **`scopeid 0x20<link>`** → Bağlantı yerel kapsamında (link-local) bir IPv6 adresi.

---

## **6. MAC Adresi (`ether`)**
```bash
ether 00:1a:2b:3c:4d:5e
```
- **MAC Adresi:** `00:1a:2b:3c:4d:5e`
- Bu adres, her ağ arayüzü için **benzersiz** bir fiziksel adresdir.
- Üretici firmayı belirlemek için kullanılabilir.

---

## **7. `txqueuelen` (İletim Kuyruk Uzunluğu)**
```bash
txqueuelen 1000  (Ethernet)
```
- Veri iletim sırasındaki maksimum kuyruk uzunluğunu gösterir.
- **Varsayılan olarak 1000**'dir.
- Aşırı trafik yükünde ayarlanabilir.

---

## **8. Veri Paketleri ve Trafik (RX/TX)**
**Gelen (RX - Received) ve Giden (TX - Transmitted) veriler şu şekilde analiz edilir:**

```bash
RX packets 12500  bytes 1002300 (1.0 MB)
```
- **12500** gelen paket alındı.
- **1002300 bayt (1.0 MB)** veri alındı.

```bash
TX packets 8300  bytes 750400 (750.4 KB)
```
- **8300** giden paket gönderildi.
- **750400 bayt (750.4 KB)** veri gönderildi.

---

## **9. Hata ve Kayıp Paketler**
Bu kısım, ağ bağlantınızda yaşanan sorunları belirlemenizi sağlar.

```bash
RX errors 0  dropped 0  overruns 0  frame 0
TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

| Alan        | Açıklama |
|-------------|----------|
| **errors**  | Veri paketlerinde hata olup olmadığını gösterir. |
| **dropped** | Cihazın veya ağın reddettiği paketler. |
| **overruns**| Arabellekte (buffer) taşma olup olmadığını gösterir. |
| **frame**   | Çerçeve hataları (örneğin yanlış MAC adresi). |
| **carrier** | Fiziksel bağlantı hataları. |
| **collisions** | Ethernet çakışmalarını gösterir (Eski ağlarda önemliydi). |

---

## **Loopback Arayüzü (`lo`)**
Loopback arayüzü, sistemin **kendisiyle iletişim kurmasını** sağlar.

Örnek:
```bash
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
    inet 127.0.0.1  netmask 255.0.0.0
    inet6 ::1  prefixlen 128  scopeid 0x10<host>
```
- **`127.0.0.1`** → Kendine yönlendirilmiş IP adresi (localhost).
- **`mtu 65536`** → Büyük boyutlu veri iletimi için yüksek değer kullanılır.

---

## **Özet**
- **`ifconfig`**, ağ arayüzleri hakkında detaylı bilgi verir.
- **IP adresi**, **MAC adresi**, **alt ağ maskesi**, **gelen/giden veri**, **hatalar** gibi birçok metrik gösterir.
- Eğer `ifconfig` komutu çalışmazsa, yeni sistemlerde yerine aşağıdaki komutlar kullanılabilir:
  ```bash
  ip a  # (ip address show)
  ip link show
  ```

Eğer özel bir ağ konfigürasyonu hakkında daha fazla detay isterseniz, belirtin! 🚀

## Ağ Hakkında Bilgi
```sh 

```
---
Kali Linux terminalinden **10.10.10.10** IP adresi hakkında detaylı bilgi almak için aşağıdaki komutları kullanabilirsiniz:

### 1. **Ping ile Canlılık Kontrolü**
```bash
ping -c 4 10.10.10.10
```
Bu komut, hedef IP'nin aktif olup olmadığını ve ağ gecikmesini test eder.

### 2. **Traceroute ile Yol Takibi**
```bash
traceroute 10.10.10.10
```
Bu komut, paketin hedefe ulaşırken geçtiği yönlendiricileri gösterir.

### 3. **DNS Bilgisi için Reverse Lookup**
```bash
nslookup 10.10.10.10
```
veya
```bash
dig -x 10.10.10.10
```
Bu komut, IP adresine bağlı bir alan adı olup olmadığını kontrol eder.

### 4. **Ağdaki Açık Portları Tarama (Nmap)**
```bash
nmap -sV -p- 10.10.10.10
```
Bu komut, hedef IP üzerindeki tüm açık portları ve çalışan servisleri tespit eder.

Eğer daha detaylı bir tarama yapmak istiyorsanız:
```bash
nmap -A 10.10.10.10
```
Bu komut, işletim sistemi tahmini, servis versiyon bilgisi ve traceroute gibi ek bilgileri içerir.

### 5. **Hedef IP'deki Servisleri Belirleme**
```bash
nmap -sC -sV 10.10.10.10
```
Bu komut, Nmap'in varsayılan komut dosyalarıyla hizmet sürümlerini belirler.

### 6. **Ağ Arayüzü Bilgisi**
```bash
ifconfig
```
veya yeni sistemlerde:
```bash
ip a
```
Bu komut, sisteminizin IP adresini ve ağ arayüzlerini gösterir.

### 7. **MAC Adresi ve Üretici Bilgisi (ARP)**
```bash
arp -a 10.10.10.10
```
Eğer hedef aynı ağdaysa, MAC adresini ve olası üretici bilgilerini gösterir.

### 8. **Hedef İşletim Sistemini Belirleme**
```bash
nmap -O 10.10.10.10
```
Bu komut, IP adresinin işletim sistemini tespit etmeye çalışır.

### 9. **Wireshark ile Ağ Trafiğini İzleme**
```bash
wireshark &
```
veya sadece belirli bir arayüzde dinleme yapmak için:
```bash
tcpdump -i eth0 -n host 10.10.10.10
```
Bu komut, hedef IP'ye giden veya ondan gelen trafiği görüntüler.

### 10. **SMB ve NetBIOS Bilgisi (Windows İçin)**
```bash
smbclient -L //10.10.10.10
```
veya NetBIOS bilgisi için:
```bash
nbtscan 10.10.10.10
```
---

## Open VPN 
```sh 

```
---

## Kali Linux Etik Hack
```sh 

```
---
https://tryhackme.com/dashboard  44
Step-1 Register olmak
Step-2 https://tryhackme.com/access
Step-3 indirilen  ovpn dosyasını çalıştırmak
$ openvpn --version
$ sudo apt update && sudo apt install openvpn -y
$ openvpn --version
$ cd ~/Desktop
$ mkdir TryHackme
$ mv ~/Downloads/pythonsoftware.ovpn ~/Desktop/TryHackme
$ sudo openvpn --config ~/Desktop/TryHackme/pythonsoftware.ovpn  (ARka planda çalışmaz)
$ sudo openvpn --config ~/Desktop/TryHackme/pythonsoftware.ovpn & disown  (Arka planda çalışsın)

## Kali Linux
```sh 

```
---

## Kali Linux
```sh 

```
---

## Kali Linux
```sh 

```
---


## Kali Linux
```sh 

```
---


## Kali Linux
```sh 

```
---




