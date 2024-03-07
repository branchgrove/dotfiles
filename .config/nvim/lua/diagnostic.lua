vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = ''
  }
})

local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    vim.diagnostic.open_float(nil, { focus = false })
  end
end

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"

local function enable_diagnostics_hover()
  vim.api.nvim_create_autocmd(
    { "CursorHold", "CursorHoldI" },
    {
      group = vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true }),
      callback = on_cursor_hold
    }
  )
end

local function disable_diagnostics_hover()
  vim.api.nvim_clear_autocmds({ group = diagnostic_hover_augroup_name })
end

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method

  -- Don't notify when no information available
  if not (result and result.contents) then
    return
  end

  -- Don't notify when no information available
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end

  -- Disable auto hover diagnostic window
  disable_diagnostics_hover()

  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = vim.api.nvim_create_augroup("lspconfig-enable-diagnostics-hover", { clear = true }),
    callback = function()
      vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
      enable_diagnostics_hover()
    end,
  })

  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

enable_diagnostics_hover()
