vim.api.nvim_create_user_command("Restart", function()
    local file = vim.fn.expand("%:p")
    local line = vim.fn.line(".")
    local tmux_pane = os.getenv("TMUX_PANE")

    if not tmux_pane then
        -- Not in tmux: fallback to a shell spawn (detached)
        vim.cmd("wa")
        vim.fn.jobstart(
            { "bash", "-lc", string.format("nvim +%d %s &", line, vim.fn.fnameescape(file)) },
            { detach = true }
        )
        vim.cmd("qa!")
        return
    end

    -- inside tmux: respawn the pane with a new nvim instance at same file/line
    local cmd = string.format([[tmux respawn-pane -k -t %s "nvim +%d %s"]], tmux_pane, line, vim.fn.fnameescape(file))
    -- ensure buffers saved
    vim.cmd("wa")
    -- run the tmux respawn (this will kill current process and immediately start new nvim)
    os.execute(cmd)
end, {})
