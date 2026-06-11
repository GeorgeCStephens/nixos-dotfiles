{ config, pkgs, ...}:

{
	home.username = "gcs";
	home.homeDirectory = "/home/gcs";
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use hyprland btw";
			rebuild-flake = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#gcs";
			dotfiles = "nvim ~/nixos-dotfiles";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec hyprland 
			fi
		'';
	};
	home.file.".config/hypr".source = ./config/hypr;
	home.file.".config/waybar".source = ./config/waybar;
	home.file.".config/foot".source = ./config/foot;
}
