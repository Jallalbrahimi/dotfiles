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

use ~/.cache/starship/init.nu


alias dotfiles = git --git-dir=$"($env.USERPROFILE | path join '.dotfiles')" --work-tree=$"($env.USERPROFILE)" 

