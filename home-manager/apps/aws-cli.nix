{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    awscli
    okta-aws-cli
    bash-my-aws
    jq
  ];
}
