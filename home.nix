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
			commit_dotfiles = "cd ~/nixos-dotfiles && git add . && git commit";
			full_rebuild = "rebuild-flake && commit_dotfiles";
		};
	};
	home.file.".config/hypr".source = ./config/hypr;
	home.file.".config/waybar".source = ./config/waybar;
	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 24;
	};
}
