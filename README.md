# NixOS configuration

Configuration used by me for personal systems.
Uses flakes and home-manager to manage the system and the configurations.

```
sudo nixos-rebuild switch --flake .#remco
```
And for home-manager:

```
home-manager switch --flake .#remco@nixos
```

To update the flake lock files use:
```
nix flake update
```
