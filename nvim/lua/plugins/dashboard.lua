return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    -- Modify the logo
    opts.config.header = vim.split(
      [[
                                                               
                                                               
                                                               
██╗   ██╗██╗███████╗████████╗██╗     ██╗   ██╗██████╗ ██╗   ██╗
██║   ██║██║██╔════╝╚══██╔══╝██║     ██║   ██║██╔══██╗██║   ██║
██║   ██║██║█████╗     ██║   ██║     ██║   ██║██████╔╝██║   ██║
╚██╗ ██╔╝██║██╔══╝     ██║   ██║     ██║   ██║██╔══██╗██║   ██║
 ╚████╔╝ ██║███████╗   ██║   ███████╗╚██████╔╝██████╔╝╚██████╔╝
  ╚═══╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝ 
                                                               
sống vui, code khỏe
    ]],
      "\n"
    )

    -- Add new actions to the center section
    -- table.insert(opts.config.center, 4, {
    --   desc = " Open Project History",
    --   icon = "x",
    --   key = "B",
    -- })

    return opts
  end,
}
