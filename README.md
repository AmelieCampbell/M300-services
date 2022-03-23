# M300-services

## M300-Services - Plattformübergreifende Dienste in ein Netzwerk integrieren
# Multi Machine Datebase Zugriff

![Net](https://github.com/AmelieCampbell/M300-services/blob/master/Images/Net.PNG)

# Dokumentation

Eine Datenbank, welche über ein Web-Frontend angesprochen werden mittels Adminer.
### Prerequisits
* Apache2 Webserver
* MySQL Datenbankserver 
* Clientmaschine 
### Inhaltsverzeichnis
  **[1. Aufbau](#1-Aufbau)**


  **[2. Codebeschreibung](#2-Codebeschreibung)**
 
  **[3. Testen](#3-Testen)**
# 1 Aufbau
Vagrant 2.2.19 und VirtualBox 6.1 Umgebung mit
Hostonly- und NAT-Netzwerkschnittstellen auf einem Windows Host:
- ## Webserver: Webserver01
  - Ubuntu Xenial64
  - Memory: 1024MB
  - Apache2 webserver
  - IP & Port: 10.10.1.10:80
  - NAT: 8080 

- ## Datenbankserver: Dataserver01
  - Ubuntu Xenial64
  - Memory: 1024MB
  - MySQL DB
  - IP & Port: 10.10.1.9:3306
# 20 Codebeschreibung
- ## Webserver aufbauen:
  - Folgende Software wird installiert: 

        debconf-utilsapache2, namp, php, libapache2-mod-php, php-curl, php-cli, php-mysql, php-gd, mysql-client.
   - Als MySQL Client wird adminer installiert 
  - Setzt im Host ein fixer DNS Eintragfür den DB-Server 
<tab>     <tab>
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- ## Datenbank Server aufbauen:
  - Das db.sh Script wird ausgeführt
    1. Root Password gesetzt
    2. Das Paket mysql-server installiert
    3. Den MySQL Port öffnen
    4. Der User für den Remote Zugriff einrichten mit einschränkung auf dem Webhost
    5. Konfiguration done
 # 30 Testen
  
Das MySQL Adminer GUI ist nun via http://localhost:8080/adminer.php per User: root und Passwort: admin erreichbar.
Es gibt noch die Möglichkeit die VM zu wechseln in der Bash:
- vagrant ssh **database**
- vagrant ssh **web**