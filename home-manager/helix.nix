{
  programs.helix = {
    enable = true;
    settings = {
      theme = "amberwood";
      editor = {
        line-number = "relative";
        mouse = false;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker.hidden = false;
      };
    };

    languages = {
      language-server = {
        basedpyright = {
          command = "basedpyright-langserver";
          args = ["--stdio"];
          config.python.analysis.typeCheckingMode = "standard";
        };

        ruff = {
          command = "ruff";
          args = ["server"];
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd"];
          formatter = {
            command = "alejandra";
            args = ["-q" "-"];
          };
        }
        {
          name = "python";
          auto-format = true;
          language-servers = ["basedpyright" "ruff"];
        }
      ];
    };

    defaultEditor = true;
  };
}
