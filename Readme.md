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

