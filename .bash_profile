export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:~/tig
export PATH=$PATH:/usr/python3.9/bin
export LIBGL_ALWAYS_INDIRECT=1
export PATH=$PATH:/usr/local/go/bin
export PATH=~/go/bin:$PATH

if [[ -f ~/.bashrc ]] ; then
  . ~/.bashrc
fi
alias clang++='clang++ -std=c++17 -Wall -Wextra -g -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/MIKANOS/mikanos/kernel/kernel.elf' 

. "$HOME/.cargo/env"
export XDG_RUNTIME_DIR="$HOME/xdg_runtime_dir"
rm -rf $XDG_RUNTIME_DIR
mkdir $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR
PYTHONPATH="/home/liquid-system/.local/lib/python3.9/site-packages:${PYTHONPATH}"
export XDG_CONFIG_HOME=~/.config

