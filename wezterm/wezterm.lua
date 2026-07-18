-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local HOME = os.getenv("HOME")

local sessions = {
  analog = {
    { cwd = HOME .. "/personal/elec_python", cmd = { "nvim", "." } },
    { cwd = HOME .. "/personal/elec_python", cmd = { "python" } },
  }
}

local function start_session(name)
  local config = sessions[name]
  if not config then
    wezterm.log_error("Unknown session: " .. tostring(name))
    return
  end

  -- create a new workspace
  local workspace = name
  local first = config[1]

  -- create the first window for the workspace
  local tab, pane, window = mux.spawn_window {
    workspace = workspace,
    cwd = first.cwd,
    args = first.cmd,
  }

  -- open the rest as new tabs in the same workspace
  for i = 2, #config do
    local entry = config[i]
    window:spawn_tab {
      cwd = entry.cwd,
      args = entry.cmd,
    }
  end

  -- activate that workspace
  mux.set_active_workspace(workspace)

  -- go fullscreen safely (after GUI is ready)
  wezterm.run_after_milliseconds(300, function()
    local gui_window = window:gui_window()
    if gui_window then
      gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
    end
  end)
end

wezterm.on('toggle-session', function(window, pane)
  local choices = {}
  for name, _ in pairs(sessions) do
    table.insert(choices, { label = name })
  end

  window:perform_action(
    wezterm.action.InputSelector {
      title = "Select a session",
      choices = choices,
      fuzzy = true,
      action = wezterm.action_callback(function(_, _, id, label)
        if label then
          start_session(label)
        end
      end),
    },
    pane
  )
end)

-- Fullscreen on startup
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window {}
  local gui_window = window:gui_window()
  if gui_window then
    gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
  end
end)

local config = wezterm.config_builder()
config.enable_kitty_keyboard = true

config.window_padding = {
  top = 0,
  bottom = 0,
}
config.font_size = 12 -- font size
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  { family = "Noto Sans Devanagari", scale = 1.1 },
})
config.harfbuzz_features = {
  "kern",
  "liga",
  "clig",
  "calt",
  "rclt",
}
config.use_cap_height_to_scale_fallback_fonts = false
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.window_background_opacity = 0.8 -- transparency

-- shortcuts: leader is just ctrl + alt
config.leader = { key = "Space", mods = "CTRL|SHIFT", timeout_milliseconds = 1000 }
config.keys = {
  -- new tab ctrl + t
  { key = "t",          mods = "CTRL",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  -- close tab ctrl + x
  { key = "x",          mods = "CTRL",       action = wezterm.action { CloseCurrentTab = { confirm = true } } },
  -- split pane horizontally leader + h
  { key = "h",          mods = "LEADER",     action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  -- split pane vertically leader + v
  { key = "v",          mods = "LEADER",     action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  -- move between panes using leader + arrow keys
  { key = "LeftArrow",  mods = "LEADER",     action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "RightArrow", mods = "LEADER",     action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "UpArrow",    mods = "LEADER",     action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "DownArrow",  mods = "LEADER",     action = wezterm.action { ActivatePaneDirection = "Down" } },
  -- maximize pane leader + m
  { key = "m",          mods = "LEADER",     action = wezterm.action.TogglePaneZoomState },
  -- rotate panes leader + c
  { key = "c",          mods = "LEADER",     action = wezterm.action.RotatePanes "Clockwise" },
  -- show pane selector leader + p
  { key = "p",          mods = "LEADER",     action = wezterm.action.PaneSelect { mode = "SwapWithActive" } },

  -- reload config leader + r
  { key = "r",          mods = "LEADER",     action = wezterm.action.ReloadConfiguration },

  -- toggle session leader + s
  { key = "s",          mods = "LEADER",     action = wezterm.action.EmitEvent "toggle-session" },

  -- copy mode ctrl + shift + c
  { key = "c",          mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
  -- paste from clipboard ctrl + shift + v
  { key = "v",          mods = "CTRL|SHIFT", action = wezterm.action { PasteFrom = "Clipboard" } },

  { key = "Return",     mods = "CTRL",       action = wezterm.action.SendString("\x1b[13;5u") },
}

return config
