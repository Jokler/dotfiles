return {
  {
    "nvim-orgmode/orgmode",
    commit = "cda615fa7c8607bfb7aaf7d2c9424dd5969f2625",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_capture_templates = {
          n = { description = "Note", template = "* %?\n" },
          t = { description = "Task", template = "* TODO %?\n" },
        },
        notifications = {
          enabled = true,
          deadline_warning_reminder_time = 1440,
          reminder_time = 10,
          deadline_reminder = true,
          scheduled_reminder = true,
          notifier = function(tasks)
            local result = {}
            for _, task in ipairs(tasks) do
              require("orgmode.utils").concat(result, {
                string.format("# %s (%s)", task.category, task.humanized_duration),
                string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title),
                string.format("%s: <%s>", task.type, task.time:to_string()),
              })
            end

            if not vim.tbl_isempty(result) then
              require("orgmode.notifications.notification_popup"):new({ content = result })
            end
          end,
          cron_notifier = function(tasks)
            for _, task in ipairs(tasks) do
              local title = string.format("%s (%s)", task.category, task.humanized_duration)
              local subtitle = string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title)
              local date = string.format("%s: %s", task.type, task.time:to_string())

              if vim.fn.executable("notify-send") == 1 then
                vim.loop.spawn("notify-send", { args = { string.format("%s\n%s\n%s", title, subtitle, date) } })
              end
            end
          end,
        },
      })
    end,
  },
  -- "joaomsa/telescope-orgmode.nvim",
  {
    "chipsenkbeil/org-roam.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        commit = "cda615fa7c8607bfb7aaf7d2c9424dd5969f2625",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles",
      })
    end,
  },
}
