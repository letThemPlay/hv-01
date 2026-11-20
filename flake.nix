{
  description = "Strata host configuration";

  inputs = {
    strata.url = "github:letThemPlay/Strata";
    # Use the nixpkgs revision Strata is tested with.
    nixpkgs.follows = "strata/nixpkgs";
  };

  outputs =
    { nixpkgs, strata, ... }:
    let
      host = import ./host.nix;
    in
    {
      # Named after the node ID, which is also the hostname, so
      # `nixos-rebuild --flake .` selects it on the host.
      nixosConfigurations.${host.strata.node.id} = nixpkgs.lib.nixosSystem {
        modules = [
          strata.nixosModules.default
          ./hardware-configuration.nix
          ./configuration.nix
          ./host.nix
        ]
        # Optional site-specific module (`strata-install --extra-module`).
        ++ nixpkgs.lib.optional (builtins.pathExists ./extra-module.nix) ./extra-module.nix;
      };
    };
}
