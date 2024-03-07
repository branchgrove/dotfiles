local helpers = {}

function helpers.merge_tables(t1, t2)
  for key, value in pairs(t2) do
      t1[key] = value
  end
end

function helpers.map_keys(mode, mappings)
  for key, mapping in pairs(mappings) do
    local opts = mapping
    opts = vim.tbl_deep_extend("force", opts, mapping)
    opts[1] = nil
    vim.keymap.set(mode, key, mapping[1], opts)
  end
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function helpers.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

return helpers
