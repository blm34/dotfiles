require("git"):setup({
    -- Order of status signs showing in the linemode
    order = 1500,
})

require("full-border"):setup({
    type = ui.Border.ROUNDED,
})

require("yatline"):setup({
    section_separator = { open = "", close = "" },
    part_separator = { open = "", close = "" },
    inverse_separator = { open = " ", close = " " },

    padding = { inner = 1, outer = 1 },

    style_a = {
        fg = "black",
        bg_mode = {
            normal = "#a89984",
            select = "#d79921",
            un_set = "#d65d0e"
        }
    },
    style_b = { bg = "#665c54", fg = "#ebdbb2" },
    style_c = { bg = "#3c3836", fg = "#a89984" },

    permissions_t_fg = "green",
    permissions_r_fg = "yellow",
    permissions_w_fg = "red",
    permissions_x_fg = "cyan",
    permissions_s_fg = "white",

    tab_width = 20,

    selected = { icon = "󰻭", fg = "yellow" },
    copied = { icon = "", fg = "green" },
    cut = { icon = "", fg = "red" },

    files = { icon = "", fg = "blue" },
    filtereds = { icon = "", fg = "magenta" },

    total = { icon = "󰮍", fg = "yellow" },
    success = { icon = "", fg = "green" },
    failed = { icon = "", fg = "red" },

    show_background = false,

    display_header_line = true,
    display_status_line = true,

    component_positions = { "header", "tab", "status" },

    header_line = {
        left = {
            section_a = {
                { type = "line", name = "tabs" },
            },
            section_b = {
                { type = "coloreds", name = "githead" },
            },
            section_c = {},
        },
        right = {
            section_a = {
                { type = "string", name = "date", params = { "%A, %d %B %Y" } },
            },
            section_b = {
                { type = "string", name = "date", params = { "%X" } },
            },
            section_c = {},
        },
    },

    status_line = {
        left = {
            section_a = {
                { type = "string", name = "tab_mode" },
            },
            section_b = {
                { type = "string", name = "hovered_size" },
            },
            section_c = {
                { type = "string",   name = "hovered_path" },
                { type = "coloreds", name = "count" },
                { type = "string",   name = "filter_query" },
                { type = "string",   name = "search_query" },
                { type = "string",   name = "finder_query" },
            },
        },
        right = {
            section_a = {
                { type = "string", name = "cursor_position" },
            },
            section_b = {
                { type = "string", name = "cursor_percentage" },
            },
            section_c = {
                { type = "string",   name = "hovered_file_extension", params = { true } },
                { type = "coloreds", name = "permissions" },
            },
        },
    },
})

require("githead"):setup({
    branch_prefix = "on",
    branch_color = "#7aa2f7",
    branch_symbol = " ",
    branch_borders = "()",

    tag_symbol = "󰓼",
    always_show_tag = true,
    tag_color = "#bb9af7",
})
