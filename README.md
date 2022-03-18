# M300-services

## M300-Services - Plattformübergreifende Dienste in ein Netzwerk integrieren
# Multi Machine Datebase Zugriff

![mmdblayout](mmdblayout.png)
![mmdblayout](lb2\images\mmdblayout.png)

# Übersicht des Projekts

Eine Datenbank kann über ein Web-Frontend angesprochen werden mittels Admirer
### Voraussetzungen
* MySQL Datenbankserver 
* Apache2 Webserver
* Clientmaschine zum ansprechen
### Inhaltsverzeichnis
* **[10 Umgebung](#10-Umgebung)**
* **[20 Codebeschreib](#20-Codebeschreib)**
* **[30 Fazit](#30-Fazit)**
## 10 Umgebung
Vagrant 2.2.19 und VirtualBox 6.1 Umgebung mit Hostonly- und NAT-Netzwerkschnittstellen auf einem Windows Host:
- **Webserver: web-srv-01**
  - _Ubuntu Xenial64_
  - _Memory 1024MB_
  - _Apache2 webserver_
  - _IP & Port 10.10.1.10:80_
  - _NAT 8080 (für den Client Zugriff)_
- **Datenbankserver: db-srv-01**
  - _Ubuntu Xenial64_
  - _Memory 1024MB_
  - _MySQL DB_
  - _IP & Port 10.10.1.9:3306_
## 20 Codebeschreib
- **Webserver aufbauen:**
  - Folgende Prerequisites mussen installiert werden: debconf-utilsapache2, namp, php, libapache2-mod-php, php-curl, php-cli, php-mysql, php-gd, mysql-client.
  - Als MySQL Client muss noch adminer installiert werden. Dies ist ein voll funktionsfähiges Datenbankverwaltungstool, das in PHP geschrieben ist.
  - Fixer DNS Eintrag für den DB Server im Hosts ergänzen.
  - Deklaration der benutzen Pakete:
<tab>    | <tab>
--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------
**debconf-utilsapache2**   | Hilfsprogramme für Webserver und enthält einige, für jeden Webserver nützliche, Zusatzprogramme. 
**nmap**        | Ist ein Werkzeug um ein Netzwerk zu erkundigen mittels Ping, Portscaner und TCP/IP Fingerprinting.
**php**        | Serverseitige, in HTML eingebettete Mehrzweck-Skriptsprache.
**libapache2-mod-php** | Dieses Paket stellt des PHP-Modul für den Webserver Apache 2 bereit.
**php-curl** | Dieses Paket stellt ein CURL-Modul für PHP bereit.
**php-cli** | Dieses Paket stellt den Kommandozeilen-Interpreter PHP zur Verfügung, der für das Testen von PHP-Skripten in einer Shell oder auch für die Erledigung von Shell-Skripting-Aufgaben verwendet werden kann.
**php-mysql** | Dieses Paket stellt ein MySQL-Modul für PHP bereit.
**php-gd** | Dieses Paket stellt ein GD-Modul für PHP bereit.
**mysql-client** | MySQL database client binaries
- **Datenbank Server aufbauen:**
  - Das db.sh Script wird ausgeführt
    1. Root Password setzen
    2. Das Paket mysql-server installieren
    3. Den MySQL Port öffnen
    4. Der User für den Remote Zugriff einrichten mit einschränkung auf dem Webhost
    5. Konfiguration abschliessen
 ## 30 Fazit
  
Das MySQL Admirer GUI ist nun via http://localhost:8080/adminer.php per User: root und Passwort: admin erreichbar.
Es gibt noch die Möglichkeit die VM zu wechseln in der Bash:
- vagrant ssh **database**
- vagrant ssh **web**