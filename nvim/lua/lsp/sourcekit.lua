local wk_status, which_key = pcall(require, 'which-key')
if not wk_status then
  return
end

vim.lsp.config('sourcekit', {
  cmd = { vim.trim(vim.fn.system 'xcrun -f sourcekit-lsp') },
  capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    which_key.add({
      {
        '<leader>1',
        function()
          vim.cmd 'XcodebuildBuildRun'
        end,
        desc = 'Xcodebuild: Build & Run',
      },
    }, { buffer = bufnr })
  end,
})
