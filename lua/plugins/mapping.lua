-- Source: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/_astrocore_mappings.lua
return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            i = {
                ["<C-s>"] = { "<Esc>:w!<cr>", desc = "Save File" },
            }
          },
        },
      },
}