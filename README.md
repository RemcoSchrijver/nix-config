# NixOS configuration

Configuration used by me for personal systems.
Uses flakes and home-manager to manage the system and the configurations.

## Running

Initial installation can be done by cloning this repo to your ~/ directory, and you can build the system
with the command in the code block below. But before starting you'll probably want to change at least the
username and the system names, you can do this in the main 
[`flake.nix`](https://github.com/RemcoSchrijver/nix-config/blob/main/flake.nix) file as well as the 
[`/nixos`](https://github.com/RemcoSchrijver/nix-config/tree/main/nixos) folder.

For a different NixOS system just create a new folder with the name you want and set up your config there and
copy your `hardware-configuration.nix` into it. Most of the heavy lifting is done by the content in the 
[`/nixos/shared`](https://github.com/RemcoSchrijver/nix-config/tree/main/nixos/shared) config directory anyway.

```bash
sudo nixos-rebuild switch --flake ~/nix-config#<system> 
```

Now this creates aliases for building your systems:

```bash
# For NixOS based on system, e.g. desktop, laptop, etc.:
nix-build-<system>

# For home-manager:
hm-switch
```

Of course, you can still use the old commands if you'd like to:
  
```bash
# For NixOS based on system, e.g. desktop, laptop, etc.:
nix-build-<system>
sudo nixos-rebuild switch --flake ~/nix-config#<system> 

# For home-manager:
home-manager switch --flake ~/nix-config#remco@nixos
```

## Updating

To update the system we want to update the flake lock files, to do so use the command below in the `~/nix-config/`
directory.

```bash
nix flake update
```

## Flatpak/Gaming

For gaming, I use Flatpak, to install them you can call the `~/nix-config/home-manager/flatpak/install_all_flatpaks.sh` 
script to install the ones I use. Make sure you have Flatpak enabled in your nix config.

To update you can just simply call:
```bash
flatpak update
```

## Scripts

The [`/scripts`](https://github.com/RemcoSchrijver/nix-config/tree/main/scripts) directory contains ones I like to use
from time to time. Most of them are written by me but some are scavenged from the internet, they aren't very 
interesting but might be helpful to you as well.
