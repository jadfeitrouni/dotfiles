-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+H/J/K/L inside herdr or Rex: move between nvim splits, and at nvim's
-- edge move to the neighbouring multiplexer pane (vim-tmux-navigator
-- equivalent; the other side is ~/.config/herdr/navigate.sh or
-- ~/.config/rex/init.lua). Inside tmux, vim-tmux-navigator handles these.
local focus_outer
if vim.env.TMUX then
  focus_outer = nil
elseif vim.env.HERDR_PANE_ID then
  local herdr = vim.env.HERDR_BIN_PATH or "herdr"
  focus_outer = function(dir)
    vim.system({ herdr, "pane", "focus", "--pane", vim.env.HERDR_PANE_ID, "--direction", dir })
  end
elseif vim.env.REX_SESSION then
  focus_outer = function(dir)
    vim.system({ "rex", "api", "call", "-s", vim.env.REX_SESSION, "session.focus_direction",
      vim.json.encode({ direction = dir }) })
  end
end

if focus_outer then
  for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
    vim.keymap.set("n", "<C-" .. key .. ">", function()
      -- Sidebars like the snacks explorer are floats anchored to a placeholder
      -- split; wincmd from the float jumps somewhere unrelated, so navigate
      -- from the split it is anchored to instead.
      local win = vim.api.nvim_get_current_win()
      local cfg = vim.api.nvim_win_get_config(win)
      local from = (cfg.relative == "win" and cfg.win) or win
      local target = vim.api.nvim_win_call(from, function()
        return vim.fn.win_getid(vim.fn.winnr(key))
      end)
      if target == from then
        focus_outer(dir)
      else
        vim.api.nvim_set_current_win(target)
      end
    end, { desc = "Go to " .. dir .. " split / multiplexer pane" })
  end
end
