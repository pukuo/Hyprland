return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  dependencies = {
    "folke/todo-comments.nvim",
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {
      sources = {
        explorer = {
          -- 基础配置
          tree = true,        -- 启用文件树（默认开启）
          git_status = true,  -- 显示 git 状态（默认开启）
          follow_file = true, -- 自动跟踪当前文件位置
          -- 布局配置（将文件树放在右侧）
          layout = {
            preset = "sidebar", -- 使用侧边栏布局
            layout = {
              position = "left" -- 将侧边栏放在右侧
            },
            preview = false     -- 关闭预览窗口（可选）
          },

          -- 文件格式显示设置
          formatters = {
            file = {
              filename_only = true, -- 仅显示文件名（不显示完整路径）
              truncate = 40         -- 路径截断长度
            }
          },
          -- 按键映射定制
          win = {
            list = {
              keys = {
                ["l"] = "confirm",        -- Enter 进入目录/打开文件
                ["h"] = "explorer_close", -- 关闭目录
                ["o"] = "explorer_open",  -- 用系统应用打开
                ["a"] = "explorer_add",   -- 新建文件/目录
                ["d"] = "explorer_del",   -- 删除文件/目录
                ["r"] = "explorer_rename" -- 重命名
              }
            }
          }
        }
      }
    }
  },
  keys = {
    { "<leader>e",  function() Snacks.explorer() end,                                                      desc = "File Explorer" },
    { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
    { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    { "<leader>z",  function() Snacks.zen() end,                                                           desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,                                                      desc = "Toggle Zoom" },
    { "<leader>.",  function() Snacks.scratch() end,                                                       desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                                desc = "Select Scratch Buffer" },
    { "<leader>n",  function() Snacks.notifier.show_history() end,                                         desc = "Notification History" },
    { "<leader>bd", function() Snacks.bufdelete() end,                                                     desc = "Delete Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end,                                            desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                                     desc = "Git Browse",                  mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end,                                                desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,                                              desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end,                                                       desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end,                                                   desc = "Lazygit Log (cwd)" },
    { "<leader>un", function() Snacks.notifier.hide() end,                                                 desc = "Dismiss All Notifications" },
    { "<c-/>",      function() Snacks.terminal() end,                                                      desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end,                                                      desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                                        desc = "Next Reference",              mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                                       desc = "Prev Reference",              mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
