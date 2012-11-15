call pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
colorscheme desert

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> f mzgg=G'z<CR
nmap <C-r> :CommandTFlush<CR>
nmap <silent> <C-t> :CommandT<CR>
let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-g>']
set wildignore+=**/tmp/**,log/**,**/uploads/**
set nolist
set nonumber
set tags+=gems.tags

let NERDTreeIgnore = ['.zeus.sock']

let g:github_token = 'dfad590151b54fc03b1c17107724a4cd'

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set number
  autocmd WinLeave * set nonumber
augroup END

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.rabl setf ruby
