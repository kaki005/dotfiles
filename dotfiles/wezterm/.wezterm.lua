local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Ubuntu 20.04 をデフォルトで起動する
config.default_domain = 'WSL:Ubuntu-22.04'
config.default_prog = {"/usr/bin/env", "zsh", "-l", "-c", "exec /usr/bin/env zsh"}
-- username は自分のユーザー名に置き換えてください
config.default_cwd = "/home/kakikaki154"


-- update
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
-- scroll backline
config.scrollback_lines = 10000
-- title barを非表示
config.window_decorations = "RESIZE"


config.keys = {
  { key = "w", mods = "ALT", action = wezterm.action.HideApplication },
}



-- 背景透過
config.window_background_opacity = 0.90
-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.font_size = 12
return config