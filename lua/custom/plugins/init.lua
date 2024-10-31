-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        'goolord/alpha-nvim',
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          local startify = require 'alpha.themes.startify'
          -- available: devicons, mini, default is mini
          -- if provider not loaded and enabled is true, it will try to use another provider
          startify.file_icons.provider = 'devicons'
          require('alpha').setup(startify.config)
        end,
      },
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
      },
      {
        'yoleuh/quandary-nvim',
        ft = { 'quandary' },
        config = true,
      },
}
