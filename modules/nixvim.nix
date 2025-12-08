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
      guifont = "JetBrainsMono Nerd Font:h14";
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
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>Telescope man_pages<CR>";
        options = {
          desc = "Search Man Pages";
        };
      }
    ];

    plugins = {
      telescope = {
        enable = true;
        settings = {
          pickers = {
            man_pages = {
              sections = [ "ALL" ];
            };
          };
        };
      };
      web-devicons.enable = true;
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
