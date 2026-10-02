{ lib, ... }:
let
    mkColourOption = colour: default: mkOption {
        type = lib.types.str;
        inherit default;
        example = "#000000";
        description = "Sets the hex value for ${colour}";
    };
    inherit (lib) mkOption;
in
{
    options.programs.configuredNeovim = {
        enable = mkOption {
            type = lib.types.bool;
            default = true;
            example = false;
            description = "Enables the nvim module";
        };

        ai = mkOption {
            type = lib.types.bool;
            default = false;
            example = true;
            description = "Enables the nvim ai module";
        };

        colours = {
            base = mkColourOption "Base" "#2E3440";
            border = mkColourOption "Border" "#2E3440";
            fg = mkColourOption "Foreground" "#D8DEE9"; 
            bg = mkColourOption "Background" "#3B4252";
            fg_selected = mkColourOption "Foreground Selected" "#D8DEE9";
            bg_selected = mkColourOption "Background Selected" "#5E81AC";
            bg_urgent = mkColourOption "Background Urgent" "#FF0000";
        }; 

        localPath = mkOption {
            type = lib.types.str;
            default = "~/Projects/NvimConfigs/"; # TODO change when move to a more sensible path
            example = "~/.config/neovim/";
            description = "The path to your neovim config (used for dev mode)";
        };
    };
}

