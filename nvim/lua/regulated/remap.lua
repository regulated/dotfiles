local keymap = vim.keymap

-- SPACE
vim.g.mapleader = " "

-- ESCAPE
vim.keymap.set("i", "jk", "<ESC>")


-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- Copy to clipboard
keymap.set('v', '<C-C>', '"+y')

-- Erase highlited words from /find
keymap.set('n', '<C-/>', '/9s8djfe<CR>')

-- Nerdtree
-- keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

-- Prettier
-- keymap.set('n', '<Leader>f', ':Prettier<CR>')

-- Primeagen Maps
vim.g.mapleader = " " 
keymap.set("n", "Q", "<nop>")

-- ' 'pv for netrw file explorer, add files w % and directories w d
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keep curser in center with <C-u> / <C-d>
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Move highlighted text with JK in V
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Find and replace shortcuts to change multiline list to one line quoted csv '', and to reverse csv
keymap.set('n', '<leader>,', ":%s/\\(.*\\)\\n/'\\1', /g<CR>")
keymap.set('n', '<leader>/', ":%s/ /\\r/g<CR>:%s/'\\(.*\\)',/\\1/g<CR>")
-- Remove blank lines
keymap.set('n', '<leader><leader>', ":%s/^$\\n//g<CR>:%s/\\n^$//g<CR>")
-- Delete all text and enter insert mode
keymap.set('n', '<leader><BS>', "gg<S-v>Gc")
-- Menu to replace current word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
