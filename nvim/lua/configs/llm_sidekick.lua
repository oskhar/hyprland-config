local M = {}

function M.setup()
  -- Set the Gemini API Key provided by the user
  vim.env.GEMINI_API_KEY = "AIzaSyCZVOPgv_CTqmRLC-Bos_pQ1t9x3N2duko"

  -- Initialize the plugin
  local status, sidekick = pcall(require, "sidekick")
  if not status then
    print("Error loading llm-sidekick: " .. sidekick)
    return
  end

  sidekick.setup({
    -- Add any specific defaults here if needed, keeping it minimal for now
    -- based on "safe defaults" mentioned in docs.
  })
end

return M
