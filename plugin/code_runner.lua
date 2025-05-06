local vim = vim
require('code_runner').setup({
  filetype = {
         javascript = "node",
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt",
    },
    cpp = {
      "cd $dir &&",
      "g++-10 -std=c++20 $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt",
    },
    python = "source ~/.virtualenvs/python/bin/activate && cd $dir && python3 -u $fileName",
    sh = "bash",
    ruby = "ruby",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt",
    },
    c = function(...)
      local c_base = {
        "cd $dir &&",
        "gcc $fileName -o",
        "/tmp/$fileNameWithoutExt",
      }
      local c_exec = {
        "&& /tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      }
      vim.ui.input({ prompt = "Add more args:" }, function(input)
        c_base[4] = input
        vim.print(vim.tbl_extend("force", c_base, c_exec))
        require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
      end)
    end,
   vim.keymap.set('n', '<leader>r', ":RunCode<CR>", { noremap = true, silent = true, })
  },
})
