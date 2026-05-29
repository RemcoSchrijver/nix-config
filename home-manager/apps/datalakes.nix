{ config, pkgs, theme, ... }:

{
    home.packages = with pkgs; [
       snowflake-cli 
    ];
}
