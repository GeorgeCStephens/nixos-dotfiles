{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  services.getty.autologinUser = "gcs";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

	programs.xwayland.enable = true;
  programs.neovim.defaultEditor = true;
	programs.neovim.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  services.pulseaudio.enable = false;

  nixpkgs.config.allowUnfree = true;

  users.users.gcs = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
	programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    neovim
		tmux
    wget
    kitty
    waybar
    git
    hyprpaper
    discord
    rofi
		fastfetch
  ];  

  nix.settings.experimental-features = [" nix-command" "flakes"];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "26.05"; # Dont change

}

