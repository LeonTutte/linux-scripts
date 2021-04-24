#			 __   ____ 
#			(  ) (_  _)
#			 )(__  )(  	
#			(____)(__)
#
# Leon Tutte 
#
# Beschreibung
# Dieses Skript setzt eine funktionierende Internetverbindung und einen "normalen" Benutzer voraus, der das Skript ausführt.
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
doas pacman -Syyu --noconfirm
echo "Raume Pacman auf"
doas pacman -Scq --noconfirm
# Installation der Basispakete
echo "Installiere Basispakete"
doas pacman -Sq base-devel git emacs nano neovim vim vi pacman-contrib --noconfirm
echo "Raume Pacman auf"
doas paccache -r
# Installation von Yay fuer AUR
echo "Wechsle ins Gitverzeichnis"
cd ~/git
echo "Klone und erstelle Yay fuer das AUR"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Aendere yay sudo zu doas"
yay --sudo doas --save
echo "Installiere Terminal inklusive Zusaetze"
yay -Sq alacritty fish xterm ranger exa starship --noconfirm
echo "Setzte Shell"
chsh -s /bin/fish
echo "Installiere Farbskripte für Login"
git clone https://gitlab.com/dwt1/shell-color-scripts.git
makepkg -si
# Installation von Zusatzapps
echo "Installiere Textverarbeitung"
yay -S texlive-most texstudio libreoffice-fresh ghostwriter qpdf okular  --noconfirm
echo "Installiere Hintergrundpakete"
yay -S wallpapers-tuxedo wallpapers-infinity-book mate-wallpapers muser-wallpapers lxde-wallpapers gnome-wallpapers jwm-wallpapers fluxbox-wallpapers elementary-wallpapers deepin-wallpapers budgie-wallpapers awesome-wallpapers plasma-workspace-wallpapers --noconfirm
