#			 __   ____ 
#			(  ) (_  _)
#			 )(__  )(  	
#			(____)(__)
#
# Leon Tutte 
#
# Beschreibung
# Dieses Skript setzt eine funktionierende Internetverbindung und einen "normalen" Benutzer voraus.
#
# Abhängigkeiten
# Für dieses Skript müssen folgende Programme bereits installiert und konfiguriert sein.
# - doas
#
#
#!/bin/bash
# Git Verzeichnis prüfen bzw. erstellen
cd ~/
if [ ! -d "~/git" ]
then
	mkdir ~/git
    echo "Gitverzeichnis wurde erstellt"
fi
# Aktualisierung des Betriebsystems
echo "Aktualisiere Spiegelserver"
doas cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
curl -s "https://archlinux.org/mirrorlist/?country=FR&country=GB&protocol=https&use_mirror_status=on" -o ~/mirrorlist_new
sed 's/#Server/Server/g' ~/mirrorlist_new >> ~/mirrorlist_new
doas mv ~/mirrorlist_new /etc/pacman.d/mirrorlist
echo "Suche nach Updates"
doas pacman -Syyu
