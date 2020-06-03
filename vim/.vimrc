set runtimepath+=~/dotfiles/vim/vim_runtime

source ~/dotfiles/vim/vim_runtime/vimrcs/basic.vim
source ~/dotfiles/vim/vim_runtime/vimrcs/filetypes.vim
source ~/dotfiles/vim/vim_runtime/vimrcs/plugins_config.vim
source ~/dotfiles/vim/vim_runtime/vimrcs/extended.vim


"Replace all is aliased to S.
    noremap S :%s///g<Left><Left><Left>
    

set timeoutlen=1000 ttimeoutlen=0
:set number relativenumber
:set nu rnu
