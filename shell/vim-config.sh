
#!/bin/bash

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cat > ~/.vimrc <<EOF
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Auto-Pairs'               " 括号自动配对
Plugin 'The-NERD-tree'            " 目录树
Plugin 'godlygeek/tabular'        " 文本对齐  :Tab / "
Plugin 'plasticboy/vim-markdown'  " markdown插件
Plugin 'scrooloose/nerdcommenter' " 代码注释
call vundle#end()
filetype plugin indent on

let mapleader=";"
nnoremap <leader>ps :NERDTree<cr>        "文件树
inoremap <c-g> <left>
"inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>

colorscheme darkblue
set nu                                   "行号
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showtabline=1
set encoding=utf-8                                 " Vim 的内部编码
set termencoding=utf-8                             " Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
set fileencoding=utf-8                             " Vim 当前编辑的文件在存储时的编码
set fileencodings=ucs-bom,utf-8,gbk,default,latin1 " Vim 打开文件时的尝试使用的编码

EOF

vim +PluginInstall +qall
