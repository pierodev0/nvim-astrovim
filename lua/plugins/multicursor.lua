--Source: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/editing-support/vim-visual-multi/init.lua
return {
    {
        "mg979/vim-visual-multi",
        event = { "User AstroFile", "InsertEnter" },
        dependencies = {
            "AstroNvim/astrocore",
            ---@param opts astrocoreopts
            opts = function(_, opts)
                if not opts.options then opts.options = {} end
                if not opts.options.g then opts.options.g = {} end
                opts.options.g.VM_silent_exit = 1
                opts.options.g.VM_show_warnings = 0

                if not opts.autocmds then opts.autocmds = {} end
                opts.autocmds.visual_multi_exit = {
                    {
                        event = "User",
                        pattern = "visual_multi_exit",
                        desc = "Avoid spurious 'hit-enter-prompt' when exiting vim-visual-multi",
                        callback = function()
                            vim.o.cmdheight = 1
                            vim.schedule(function() vim.o.cmdheight = opts.options.opt.cmdheight end)
                        end,
                    },
                }

                if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
                local maps = assert(opts.mappings)
                maps.n["<C-up>"] = { "<C-u>call vm#commands#add_cursor_up(0, v:count1)<cr>", desc = "Add cursor above" }
                maps.n["<C-down>"] = { "<C-u>call vm#commands#add_cursor_down(0, v:count1)<cr>", desc =
                "Add cursor below" }
            end,
        },
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        cmd = {
            "MultipleCursorsAddDown",
            "MultipleCursorsAddUp",
            "MultipleCursorsMouseAddDelete",
            "MultipleCursorsAddMatches",
            "MultipleCursorsAddMatchesV",
            "MultipleCursorsAddJumpNextMatch",
            "MultipleCursorsJumpNextMatch",
            "MultipleCursorsLock",
        },
        dependencies = {
            "AstroNvim/astrocore",
            opts = function(_, opts)
                local maps = opts.mappings
                for lhs, map in pairs {
                    ["<C-Down>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
                    ["<C-Up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
                    ["<C-LeftMouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", desc = "Add cursor with mouse" },
                } do
                    maps.n[lhs] = map
                    maps.i[lhs] = map
                end
                local prefix = "<Leader>m"
                for lhs, map in pairs {
                    [prefix .. "a"] = { "<Cmd>MultipleCursorsAddMatches<CR>", desc = "Add cursor matches" },
                    [prefix .. "A"] = { "<Cmd>MultipleCursorsAddMatchesV<CR>", desc = "Add cursor matches in previous visual area" },
                    [prefix .. "j"] = { "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", desc = "Add cursor and jump to next match" },
                    [prefix .. "J"] = { "<Cmd>MultipleCursorsJumpNextMatch<CR>", desc = "Move cursor to next match" },
                    [prefix .. "l"] = { "<Cmd>MultipleCursorsLock<CR>", desc = "Lock virtual cursors" },
                } do
                    maps.n[lhs] = map
                    maps.x[lhs] = map
                end
            end,
        },
        opts = {},
    }
}
