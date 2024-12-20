-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Trigger autoread when files change on disk



-- vim auto reading
-- Define file exension and filetype variables
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


vim.api.nvim_create_autocmd('TextYankPost',{
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank',{clear=true}),
  callback = function()
    vim.highlight.on_yank();
  end
})
--nvim lsp autocommands
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre',{
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({
            vim.lsp.buf.format({bufnr = args.buf , id = client.id})
          })
        end
            })
      end
    end,
})

