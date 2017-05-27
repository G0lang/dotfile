if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/sadegh/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/sadegh/dotfile/nvim/.'
let g:dein#_runtime_path = '/home/sadegh/dotfile/nvim/./.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/sadegh/dotfile/nvim/./.cache/init.vim'
let &runtimepath = '/home/sadegh/.config/nvim,/etc/xdg/nvim,/home/sadegh/.local/share/nvim/site,/usr/local/share/nvim/site,/home/sadegh/dotfile/nvim/./repos/github.com/zchee/nvim-go,/home/sadegh/dotfile/nvim/.//repos/github.com/Shougo/dein.vim,/home/sadegh/dotfile/nvim/./.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/sadegh/dotfile/nvim/./.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/sadegh/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/sadegh/.config/nvim/after'
filetype off
