{
  inputs,
  nixpkgs,
  self,
  username,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs username;};
    modules =
      [(import ./bootloader.nix)]
      ++ [(import ./hardware.nix)]
      # ++ [(import ./xserver.nix)]
      ++ [(import ./steam.nix)]
      ++ [(import ./alvr.nix)]
      ++ [(import ./network.nix)]
      ++ [(import ./pipewire.nix)]
      ++ [(import ./programs.nix)]
      ++ [(import ./security.nix)]
      ++ [(import ./services.nix)]
      ++ [(import ./system.nix)]
      ++ [(import ./systemd.nix)]
      ++ [(import ./user.nix)]
      ++ [(import ./wayland.nix)]
      # ++ [(import ./cloudflare-warp.nix)]
      # ++ [(import ./virtualization.nix)]
      ++ [(import ./../../hosts/nixos/hardware-configuration.nix)];
  };
}
