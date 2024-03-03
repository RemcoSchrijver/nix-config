# Add flathub as remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.valvesoftware.Steam

# Setting Games directory as another library location
flatpak override --user --filesystem=/games/Steam com.valvesoftware.Steam
