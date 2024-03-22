{
  description = "otterpip's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    username = "piper";
  in {
    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs username;
    };
  };
}
