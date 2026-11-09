-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+H/J/K/L inside herdr: move between nvim splits, and at nvim's edge move
-- to the neighbouring herdr pane (vim-tmux-navigator equivalent; herdr side is
-- ~/.config/herdr/navigate.sh). Inside tmux, vim-tmux-navigator handles these.
if vim.env.HERDR_PANE_ID and not vim.env.TMUX then
  local herdr = vim.env.HERDR_BIN_PATH or "herdr"
  for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
    vim.keymap.set("n", "<C-" .. key .. ">", function()
      local win = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(key)
      if vim.api.nvim_get_current_win() == win then
        vim.system({ herdr, "pane", "focus", "--pane", vim.env.HERDR_PANE_ID, "--direction", dir })
      end
    end, { desc = "Go to " .. dir .. " split / herdr pane" })
  end
end
