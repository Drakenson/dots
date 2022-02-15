set nowrap
set number
set tabstop=4
set shiftwidth=4
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark
let g:netrw_dirhistmax = 0
au VimEnter * hi Normal ctermbg=none
au VimLeave * !echo -ne "\033[0m"
