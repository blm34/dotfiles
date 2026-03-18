-- Determine name of terminal
local function get_terminal_name()
    local terms = require("toggleterm.terminal").get_all()
    local buf = vim.api.nvim_get_current_buf()

    for _, term in pairs(terms) do
        if term.bufnr == buf then
            if term.id < 10 then
                return "Terminal " .. term.id
            else
                return term.display_name
            end
        end
    end
end

-- Show git branch and worktree

local branch_cache = {}

local function git_branch_and_worktree()
    local bufnr = vim.api.nvim_get_current_buf()

    if branch_cache[bufnr] then
        return branch_cache[bufnr]
    end

    local filename = vim.api.nvim_buf_get_name(bufnr)
    local dir
    if filename ~= "" then
        dir = vim.fn.fnamemodify(filename, ":h")
    else
        dir = vim.fn.getcwd()
    end

    -- Branch name
    local handle = io.popen('git -C "' .. dir .. '" rev-parse --abbrev-ref HEAD 2>&1')
    if not handle then
        branch_cache[bufnr] = ""
        return ""
    end
    local branch = handle:read("*l") or ""
    handle:close()

    branch = branch:gsub("%s+", "")

    -- Exit if not in a git repo
    if branch == "" or branch == "HEAD" or branch:match("^fatal") then
        branch_cache[bufnr] = ""
        return ""
    end

    -- Get git directory
    local git_dir_handle = io.popen('git -C "' .. dir .. '" rev-parse --git-dir 2>&1')
    local git_dir = git_dir_handle and git_dir_handle:read("*l") or ""
    if git_dir_handle then git_dir_handle:close() end

    git_dir = git_dir:gsub("%s+", "")

    -- Detect worktree name
    local wt = ""
    if git_dir ~= "" then
        local match = git_dir:match("[/\\]worktrees[/\\](.+)$")
        if match then
            wt = match
        end
    end

    local result = " " .. branch
    if wt ~= "" then
        result = result .. " ( " .. wt .. ")"
    end
    branch_cache[bufnr] = result
    return result
end

-- Clear cache on buffer enter / write / git events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        branch_cache[bufnr] = nil
    end
})

-- Determine unique file name/path
local function unique_path()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then return "[No Name]" end

    local filename = vim.fn.fnamemodify(bufname, ":t")

    -- Collect all buffers with this filename
    local duplicates = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= "" and vim.fn.fnamemodify(name, ":t") == filename then
                table.insert(duplicates, name)
            end
        end
    end

    -- Only one file with this name - just show the filename
    if #duplicates <= 1 then return filename end

    -- Cross-platform path splitter
    local sep = package.config:sub(1, 1)
    local function split_path(p)
        local parts = {}
        for part in p:gmatch("[^/\\]+") do
            table.insert(parts, part)
        end
        return parts
    end

    -- Build the shortest unique path for the current buffer
    local parts = split_path(bufname)
    for depth = 2, #parts do
        local candidate_parts = {}
        for i = #parts - depth + 1, #parts do
            table.insert(candidate_parts, parts[i])
        end
        local candidate = table.concat(candidate_parts, sep)

        local unique = true
        for _, other in ipairs(duplicates) do
            if other ~= bufname then
                local other_parts = split_path(other)
                local other_candidate_parts = {}
                for i = #other_parts - depth + 1, #other_parts do
                    table.insert(other_candidate_parts, other_parts[i])
                end
                local other_candidate = table.concat(other_candidate_parts, sep)
                if candidate == other_candidate then
                    unique = false
                    break
                end
            end
        end
        if unique then return candidate end
    end

    -- Fallback: full path
    return bufname
end

-- Show current harpoon index and count
local function harpoon_statusline()
    -- Don't trigger loading of harpoon just for the status line
    if not package.loaded["harpoon"] then
        return ""
    end

    local harpoon = require("harpoon")
    local list = harpoon:list()

    if not list or not list.items then
        return ""
    end

    local total = #list.items
    if total == 0 then
        return ""
    end

    local buf_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
    local idx = nil

    for i, item in ipairs(list.items) do
        if vim.fn.fnamemodify(item.value, ":p") == buf_path then
            idx = i
            break
        end
    end

    if idx then
        return string.format("󱡅 %d/%d", idx, total)
    else
        return string.format("󱡅 %d", total)
    end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        require("lualine").setup({
            options = {
                theme = "tomorrow_night",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                icons_enabled = true,
                globalstatus = false,
                disabled_filetypes = { 'NvimTree' },
            },
            sections = {
                lualine_a = {
                    "mode"
                },
                lualine_b = {
                    {
                        git_branch_and_worktree,
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    {
                        "diff",
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    }
                },
                lualine_c = {
                    {
                        unique_path,
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    {
                        get_terminal_name,
                        cond = function() return vim.bo.buftype == "terminal" end
                    }
                },
                lualine_x = {
                    {
                        "searchcount",
                        icon = "⌕",
                    },
                    {
                        "diagnostics",
                        sources = { 'nvim_lsp' },
                    },
                    {
                        harpoon_statusline,
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    "encoding",
                },
                lualine_y = {
                    {
                        "lsp_status",
                        separator = ",",
                    },
                },
                lualine_z = {
                    "location",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        unique_path,
                        cond = function() return vim.bo.buftype ~= "terminal" end,
                    },
                    {
                        get_terminal_name,
                        cond = function() return vim.bo.buftype == "terminal" end,
                    }
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = { "quickfix", "nvim-tree" }
        })
    end
}
