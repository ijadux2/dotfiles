mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu

$env.config.show_banner = false

alias x = clear
alias v = nvim
alias yay = pacstall
alias cd = z 

let config_dir = "${config.xdg.configHome}/nushell"
mkdir $config_dir

fastfetch
