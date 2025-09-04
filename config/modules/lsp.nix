{
  config = {
    # Enable LSP (Language Server Protocol) support
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers.typos_lsp = {
        enable = true;
        extraOptions = {
          init_options.diagnosticSeverity = "Hint";
        };
      };

      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
    };
# UI enhancements for LSP
    # plugins.fidget.enable = true;        # Show LSP progress
    lspkind.enable = true;       # VSCode-like icons in completion
    lsp-signature.enable = true; # Show function signature hints
    lint.enable = true;
    lsp-lines.enable = true;
  };

      

      };
}

