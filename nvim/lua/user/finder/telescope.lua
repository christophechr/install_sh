-- https://github.com/nvim-telescope/telescope.nvim
-- telescope
local okteles, telescope = pcall(require, 'telescope')
if not okteles then
    return
end
telescope.setup({
    defaults = {
        initial_mode = "insert",
        file_ignore_patterns = {
            "__pycache__/", "__pycache__/*",
            "node_modules/", "node_modules/*",
            "dist/", "dist/*", "build/", "build/*",
            ".git/", ".git/*",
            ".gradle", ".idea/", ".vscode/",
            ".dll", ".idea/*", ".vscode/*"
        },
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        live_grep = {
            preview = {
                treesitter = false
            }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            case_mode = 'smart_case'
        },
    },
})
telescope.load_extension('fzf')

local opts = {  }
-- " Find files using Telescope command-line sugar.
vim.keymap.set('n', 'tf', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find_files', noremap = true, silent = true })
vim.keymap.set('n', 'tg', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope live_grep', noremap = true, silent = true })
vim.keymap.set('n', 'tb', '<cmd>Telescope buffers<cr>', { desc = 'Telescope buffers', noremap = true, silent = true })
vim.keymap.set('n', 'th', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope help_tags', noremap = true, silent = true })
