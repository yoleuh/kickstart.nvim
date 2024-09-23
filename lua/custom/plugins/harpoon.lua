
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { 'harpoon' },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,

        -- enable tabline with harpoon marks
        tabline = true,
        tabline_prefix = '   ',
        tabline_suffix = '   ',
      },
      menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.cmd 'highlight! HarpoonInactive guibg=NONE guifg=#63698c'
    vim.cmd 'highlight! HarpoonActive guibg=NONE guifg=white'
    vim.cmd 'highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7'
    vim.cmd 'highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7'
    vim.cmd 'highlight! TabLineFill guibg=NONE guifg=white'
  end,
  keys = {
    { '<leader>a', desc = 'Harpoon add file' },
    { '<C-e>', desc = 'Harpoon quick menu' },
  },
}
