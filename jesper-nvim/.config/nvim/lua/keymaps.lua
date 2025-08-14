-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- General
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

-- LSP
-- vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP: Rename" })
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
-- vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP: References" })
-- vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP: Definitions" })
-- vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP: Implementations" })
-- vim.keymap.set("n", "gO", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP: Doc Symbols" })
-- vim.keymap.set("n", "gW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "LSP: WorkSpace Symbols" })
