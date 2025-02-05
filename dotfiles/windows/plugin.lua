-- starship.lua
load(io.popen('starship init cmd'):read("*a"))()
os.setenv('STARSHIP_CONFIG', string.format('%s\\dotfiles\\dotfiles\\starship\\starship.toml', os.getenv("HOME")))
io.write("plugin load completed.")
