{ pkgs, lib, ... }:
{
  plugins = {
    dap-python.enable = true;

    conform-nvim.settings = {
      formatters_by_ft.python = [
        "ruff_format"
        "ruff_organize_imports"
      ];
    };

    lint = {
      lintersByFt.python = [ "ruff" ];
      linters.ruff = {
        cmd = lib.getExe pkgs.ruff;
        args = [
          "--select=E,F,UP,N,I,ASYNC,S,PTH"
          "--ignore=E112"
          "--line-length=79"
          "--respect-gitignore"
          "--target-version=py311"
        ];
      };
    };

    lsp.servers = {
      pyright = {
        enable = true;
        extraOptions.settings = {
          # Using Ruff's import organizer
          pyright.disableOrganizeImports = true;
          python.analysis = {
            # Ignore all files for analysis to exclusively use Ruff for linting
            ignore.__raw = ''{ '*' }'';
          };
        };
      };

      ruff = {
        enable = true;
        extraOptions.init_options = {
          settings = {
            args = [
              "--select=E,F,UP,N,I,ASYNC,S,PTH"
              "--ignore=E112"
              "--line-length=79"
              "--respect-gitignore"
              "--target-version=py311"
            ];
          };
          onAttach.function = ''
            if client.name == 'ruff' then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          '';
        };
      };
    };
  };
}
