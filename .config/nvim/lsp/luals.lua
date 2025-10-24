    return {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          signatureHelp = { enabled = true },
        },
      },
    }
