{
  config = {
    colorschemes.ayu.enable = true;

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight = {
            additional_vim_regex_highlighting = true;
            enable = true;
          };
          ensure_installed = [
            "python"
            "lua"
            "json"
            "html"
            "css"
            "javascript"
            "bash"
            "cpp"
            "nix"
          ];
        };
      };
    };
  };
}
