export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/tig
export LIBGL_ALWAYS_INDIRECT=1
export PATH=$PATH:/usr/local/go/bin
export PATH=~/go/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export PATH="$HOME/.poetry/bin:$PATH"

alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/MIKANOS/mikanos/kernel/kernel.elf'

. "$HOME/.cargo/env"
