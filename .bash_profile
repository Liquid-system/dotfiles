export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:~/tig
export LIBGL_ALWAYS_INDIRECT=1
export PATH=$PATH:/usr/local/go/bin
export PATH=~/go/bin:$PATH
export PATH=$PATH:~/.local/bin

if [[ -f ~/.bashrc ]] ; then
  . ~/.bashrc
fi
alias clang++='clang++ -std=c++17 -stdlib=libc++ -Wall -Wextra -g -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/MIKANOS/mikanos/kernel/kernel.elf' 

. "$HOME/.cargo/env"
PYTHONPATH="/home/liquid-system/.local/lib/python3.9/site-packages:${PYTHONPATH}"

