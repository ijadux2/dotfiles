mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"


alias x = clear
alias v = nvim
alias yay = pacstall
alias cd = z
alias home = home-manager switch
alias l = ls 


let config_dir = "${config.xdg.configHome}/nushell"
mkdir $config_dir

fastfetch
