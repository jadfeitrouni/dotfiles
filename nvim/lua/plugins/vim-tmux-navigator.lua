return {
    "christoomey/vim-tmux-navigator",
    -- Inside herdr or Rex (and not tmux), lua/config/keymaps.lua handles Ctrl+H/J/K/L
    cond = vim.env.TMUX ~= nil or (vim.env.HERDR_PANE_ID == nil and vim.env.REX_SESSION == nil),
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}
