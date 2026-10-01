{ pkgs, 
    # enableAi ? false, 
    # colours ? {
    #     base = "#2E3440";
    #     border = "#2E3440";
    #     fg = "#D8DEE9"; 
    #     bg = "#3B4252";
    #     fg_selected = "#D8DEE9";
    #     bg_selected = "#5E81AC";
    #     bg_urgent = "#FF0000";
    # },
... }:

let
    lib = pkgs.lib;
    enableAi = false; # TODO move
    nvimTheme = import ./theme.nix {
        inherit pkgs;
        colours = {
            base = "#2E3440";
            border = "#2E3440";
            fg = "#D8DEE9"; 
            bg = "#3B4252";
            fg_selected = "#D8DEE9";
            bg_selected = "#5E81AC";
            bg_urgent = "#FF0000";
        };
    };
in
{
    enable = true;
    appName = "nv";
    desktopEntry = false;
    extraBinPath = with pkgs; [
        # Language Servers
        rust-analyzer
        nixd
        typescript-language-server
        jdt-language-server # Broken?
        pyright
        lua-language-server
        vscode-langservers-extracted
        bash-language-server
        clang-tools
        zls
        luajitPackages.luarocks 
        openssl
        gopls
        ltex-ls-plus

        vue-language-server
        # (pkgs.vue-language-server.overrideAttrs (old: { FIX readd if problems with vuels
        #     postInstall = (old.postInstall or "") + ''
        #         ln -s \
        #           $out/lib/language-tools/node_modules/.pnpm/typescript@6.0.3/node_modules/typescript \
        #           $out/lib/language-tools/packages/typescript-plugin/node_modules/typescript
        #     '';
        # }))
        vtsls

        # Deps
        rustc
        cargo
        openssl
        go
    ];
    plugins = {
        dev.config.pure = ./.;
        start = with pkgs.vimPlugins; [
            # Snacks
            snacks-nvim

            # UI #
            bufferline-nvim
            lualine-nvim
            mini-icons

            # Code #
            nvim-treesitter.withAllGrammars
            blink-cmp
            luasnip
            nvim-lspconfig
            nvim-comment
            sidekick-nvim
            minuet-ai-nvim

            # Notes
            render-markdown-nvim
            vim-gnupg
        ];
    };
    initLua = ''
        _G.paths = {
            vue_language_server =
                "${pkgs.vue-language-server}/lib/language-tools/packages/typescript-plugin";
                gtk_theme = "${nvimTheme}";
        }

        _G.options = {
            enableAi = ${lib.boolToString enableAi},
        }
        require("main")
    '';
}
