-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- General
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "General: Exit terminal mode" })

vim.keymap.set("n", "U", "<C-r>", { desc = "General: Redo" })
vim.keymap.set("n", "l", "o<ESC>", { desc = "General: Newline after cursor" })
vim.keymap.set("n", "L", "O<ESC>", { desc = "General: Newline before cursor" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "General: Write current buffer" })

-- Windowmgmt
vim.keymap.set("n", "<A-S-Left>", "<C-w>h", { desc = "General: Window left" })
vim.keymap.set("n", "<A-S-Right>", "<C-w>l", { desc = "General: Window right" })
vim.keymap.set("n", "<A-S-Down>", "<C-w>j", { desc = "General: Window down" })
vim.keymap.set("n", "<A-S-Up>", "<C-w>k", { desc = "General: Window up" })

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Windowmgmt: Quit focused window" })
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Windowmgmt: Close current buffer" })
