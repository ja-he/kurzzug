local colorscheme = require("kurzzug")
local lushwright = require("shipwright.transform.lush")
run(colorscheme,
  lushwright.to_vimscript,
  { overwrite, "colors/kurzzug.vim" })
run(colorscheme,
  lushwright.to_lua,
  { patchwrite, "colors/kurzzug.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })
