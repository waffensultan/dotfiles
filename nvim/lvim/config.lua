-- Enable powershell as default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
}

-- NON-NATIVE SECTION

vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.guicursor = "a:blinkon100,i-ci-ve:hor20"
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })

lvim.plugins = {
    { "EdenEast/nightfox.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },
}

lvim.colorscheme = "carbonfox"
lvim.format_on_save.enabled = true

lvim.builtin.lualine.options = {
    component_separators = "|",
    section_separators = { left = '', right = '' },
}
lvim.builtin.lualine.sections = {
    lualine_a = { 'mode' }
}

-- Keybindings
lvim.keys.normal_mode["<leader>bd"] = "<Cmd>bprevious <bar> bdelete #<CR>"
