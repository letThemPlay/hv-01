# Strata host configuration: the policy shared by Strata hosts.
#
# Machine-specific values (node ID, admin keys, install disk, management
# interface and addressing) live in host.nix.
#
# See docs/administration/options.md in the Strata repository for every
# option.
{
  strata = {
    enable = true;

    agent.enable = true;

    # libvirt with KVM-accelerated, unprivileged QEMU.
    compute.enable = true;

    # Key-only SSH for the admin account, which has passwordless sudo.
    access.enable = true;

    # System disk layout and boot loader (the disk is set in host.nix).
    disk = {
      enable = true;
      layout = "ext4";
    };

    # Management interface and firewall (the interface is set in host.nix).
    networking.enable = true;

    monitoring.enable = true;
  };

  # The NixOS release this host was first installed with. Do not change it
  # on upgrades; see `man configuration.nix` (system.stateVersion).
  system.stateVersion = "26.05";
}
