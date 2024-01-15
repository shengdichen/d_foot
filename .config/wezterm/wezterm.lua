local WEZTERM = require("wezterm")

local function visual(c)
    local function font()
        local fam = "Source Code Pro"

        c["font"] = WEZTERM.font(fam .. "Medium")
        c["font_size"] = 12.0

        local f_minus = WEZTERM.font(fam, { weight = "Light", italic = false })
        local f_normal = WEZTERM.font(fam, { weight = "Medium", italic = false })
        local f_plus = WEZTERM.font(fam, { weight = "Black", italic = false })
        c["font_rules"] = {
            { intensity = "Half",   italic = false, font = f_minus },
            { intensity = "Normal", italic = false, font = f_normal },
            { intensity = "Bold",   italic = false, font = f_plus },

            { intensity = "Half",   italic = true,  font = f_minus },
            { intensity = "Normal", italic = true,  font = f_normal },
            { intensity = "Bold",   italic = true,  font = f_plus },
        }
    end

    local function colorscheme()
        c["window_background_opacity"] = 0.9062

        local black = "#000000"
        local white = "#efe3fb"
        c["colors"] = {
            background = black,
            foreground = white,

            ansi = {
                black,
                "#ef1757",
                "#3fbf5f",
                "#efd767",
                "#3f1ff7",
                "#ef77c7",
                "#7fd7f3",
                "#97879f",
            },
            brights = {
                "#2b272f",
                "#bf1f1f",
                "#1fbf1f",
                "#bfbf1f",
                "#1f1fbf",
                "#bf1fbf",
                "#1fbfbf",
                white,
            },
        }

        c["bold_brightens_ansi_colors"] = true

        -- cursor.bg <= text.fg
        c["force_reverse_video_cursor"] = true
    end

    local function decoration()
        c["window_decorations"] = "NONE"
        c["enable_scroll_bar"] = false
        c["enable_tab_bar"] = false

        local paddings = {}
        for _, dir in ipairs({ "left", "right", "top", "bottom" }) do
            paddings[dir] = 0
        end
        c["window_padding"] = paddings
    end

    font()
    colorscheme()
    decoration()
end

local function bind(c)
    -- interference with tmux-binds
    c["disable_default_key_bindings"] = true

    local action = WEZTERM.action
    c["keys"] = {
        { key = "-", mods = "CTRL", action = action.DecreaseFontSize, },
        { key = "=", mods = "CTRL", action = action.IncreaseFontSize, },
        { key = "0", mods = "CTRL", action = action.ResetFontSize, },
    }
end

local function ime(c)
    c["use_ime"] = true
    c["xim_im_name"] = "fcitx"
end

local function main()
    local c = {}

    visual(c)
    bind(c)
    ime(c)

    return c
end
return main()
