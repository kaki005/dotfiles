-- starship.lua
load(io.popen('starship init cmd'):read("*a"))()
os.setenv('STARSHIP_CONFIG', '$HOME\dotfiles\dotfiles\starship\starship.toml')

io.writeline("plugin load completed.")
