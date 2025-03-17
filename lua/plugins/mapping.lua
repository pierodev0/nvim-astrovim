-- Source: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/_astrocore_mappings.lua
return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                -- first key is the mode
                n = {
                    -- second key is the lefthand side of the map
                    ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                    
                    ["L"] = {
                        function() require("astrocore.buffer").nav(vim.v.count1) end,
                        desc = "Next buffer",
                    },
                    ["H"] = {
                        function() require("astrocore.buffer").nav(-vim.v.count1) end,
                        desc = "Previous buffer",
                    }

                },
                t = {
                    -- setting a mapping to false will disable it
                    -- ["<esc>"] = false,
                },
            },
        },
    },
}
