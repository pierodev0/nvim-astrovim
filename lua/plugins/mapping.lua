-- Source: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/_astrocore_mappings.lua
return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
                ["<S-h>"] = {
                    function() require("astrocore.buffer").nav(vim.v.count1) end,
                    desc = "Next buffer",
                },
                ["<S-l>"] = {
                    function() require("astrocore.buffer").nav(-vim.v.count1) end,
                    desc = "Previous buffer",
                },
            },
            i = {
                ["<C-s>"] = { "<Esc>:w!<cr>", desc = "Save File" },
            }
          },
        },
      },
}