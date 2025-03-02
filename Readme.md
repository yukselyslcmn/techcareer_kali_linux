

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

## Kali Linux
```sh 

```
---



