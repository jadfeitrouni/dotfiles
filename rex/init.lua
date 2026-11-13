-- Rex configuration. Reload with `rex config reload`; inspect with `rex keymap`.

-- Ctrl+H/J/K/L: switch panes, vim-tmux-navigator style. If the focused pane is
-- running vim/nvim or fzf, the key goes to it instead (nvim moves to the next
-- Rex pane itself when it hits its edge; see nvim/lua/config/keymaps.lua).
local TERMINAL = "com.superlogical.terminal"
local PASSTHROUGH = { "^n?vim?x?$", "^n?vim?x?diff$", "^view$", "^viewdiff$", "^fzf$" }

local function wants_key(block_id)
  local p = rex.block.call(TERMINAL, "process", { block_id = block_id })
  local name = p and p.foreground and p.foreground.name
  if not name then return false end
  for _, pat in ipairs(PASSTHROUGH) do
    if name:match(pat) then return true end
  end
  return false
end

for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("ctrl+" .. key, function(ctx, ev)
    if ctx.block_id and wants_key(ctx.block_id) then
      return false -- send the key to the terminal
    end
    rex.session.focus_direction({ session_id = ctx.session_id, direction = dir })
    return true
  end)
end
