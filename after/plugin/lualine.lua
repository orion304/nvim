require("lualine").setup {
    options = {
        theme = 'iceberg_dark',
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
    }
}
