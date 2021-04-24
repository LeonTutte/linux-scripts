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
