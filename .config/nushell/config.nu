# Nushell Config File
#
# version = "0.98.0"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
# The default config record. This is where much of your global configuration is setup.
$env.config = {
    show_banner: true # true or false to enable or disable the welcome banner at startup
    error_style: "plain" # "fancy" or "plain" for screen reader-friendly error messages

    buffer_editor: hx # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    edit_mode: vi # emacs, vi
    shell_integration: {
        # osc133 is several escapes invented by Final Term which include the supported ones below.
        # 133;A - Mark prompt start
        # 133;B - Mark prompt end
        # 133;C - Mark pre-execution
        # 133;D;exit - Mark execution finished with exit code
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        osc133: false
    }
}


export-env { $env.YAZI_CONFIG_HOME = "~/.config/yazi" }

alias dotfiles = git --git-dir=$"($env.HOME | path join '.dotfiles')" --work-tree=$"($env.HOME)" 
# alias ls = eza --icons -F -H --group-directories-first --git -1
# alias hx = hx -c $"($env.XDG_CONFIG_HOME | path join 'helix/config.toml')"

let btop_cmd = if ($nu.os-info.name == 'windows') { "btop4win.exe" } else { "btop" }
def btop [] {
    ^$btop_cmd 
}
#use ~/.cache/starship/init.nu
