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
			nconf_edit = "nvim ~/.config/nvim/init.lua";
			hconf_edit = "nvim ~/nixos-dotfiles/config/hypr/hyprland.conf";
			conf_edit = "nvim ~/nixos-dotfiles/config/";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec start-hyprland 
			fi
		'';
	};
	home.file.".config/hypr".source = ./config/hypr;
	home.file.".config/waybar".source = ./config/waybar;
}
