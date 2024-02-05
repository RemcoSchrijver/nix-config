# NixOS configuration

Configuration used by me for personal systems.
Uses flakes and home-manager to manage the system and the configurations.

```bash
sudo nixos-rebuild switch --flake ~/path/to/nix-config#<system> 
```
And for home-manager:

```bash
home-manager switch --flake ~/path/to/nix-config#remco@nixos
```

To update the flake lock files use:
```bash
nix flake update
```

## Flatpak

For gaming, I use Flatpak, to install them you can call the `./home-manager/flatpak/install_all_flatpaks.sh` 
script to install the ones I use. Make sure you have Flatpak enabled in your nix config.

To update you can just simply call:
```bash
flatpak update
```
