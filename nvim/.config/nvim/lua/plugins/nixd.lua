local flake = '(builtins.getFlake "/home/abdulaziz/nixos")'
local nixosOpts = flake .. ".nixosConfigurations.chandrila.options"

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
					settings = {
						nixd = {
							nixpkgs = {
								-- enables pkgs.<TAB> completion from your flake's nixpkgs
								expr = "import " .. flake .. ".inputs.nixpkgs { }",
							},
							formatting = {
								command = { "alejandra" },
							},
							options = {
								-- NixOS options: services.*, boot.*, etc.
								nixos = {
									expr = nixosOpts,
								},
								-- home-manager options (HM-as-NixOS-module variant):
								-- resolves programs.*, wayland.*, etc. inside home-manager.users.<name>
								home_manager = {
									expr = nixosOpts .. ".home-manager.users.type.getSubOptions []",
								},
							},
						},
					},
				},
			},
		},
	},
}
