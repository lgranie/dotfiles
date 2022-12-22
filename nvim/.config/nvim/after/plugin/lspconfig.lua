local opts = { 
  noremap = true,
  silent = true
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local util = require('lspconfig')['util']

local groovyls = require('lspconfig')['groovyls']
groovyls.setup {
  cmd = {
    '/home/lgranie/opt/groovy-language-server/groovyls'
  },
  root_dir = function(fname)
    return util.root_pattern 'build.gradle'(fname) or util.root_pattern 'Jenkinsfile'(fname) or util.find_git_ancestor(fname)
  end
}

local bashls = require('lspconfig')['bashls']
bashls.setup {
  filetypes = { "sh", "zsh" }
}

