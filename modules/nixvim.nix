{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    colorschemes.nord.enable = true;

    extraPackages = with pkgs; [
      nixfmt-rfc-style
    ];
    opts = {
      number = true;
      relativenumber = true;
    };
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>Format<CR>";
        options = {
          desc = "Format Buffer";
        };
      }
    ];

    plugins = {
      plugins.telescope = {
        enable = true;
        keymaps = {
          "<leader>m" = "man_pages";
        };
      };
      which-key = {
        enable = true;
        settings = {
          preset = "helix";
        };
      };

      markview.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      lsp = {
        enable = true;
        servers = {
          html.enable = true;
          cssls.enable = true;
          ts_ls.enable = true;
          jsonls.enable = true;
          nixd = {
            enable = true;
            settings = {
              formatting = {
                command = [ "nixfmt" ];
              };
            };
          };
        };
      };
      lsp-format.enable = true;
    };
  };
}
