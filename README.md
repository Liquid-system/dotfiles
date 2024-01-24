## Liquid-system dotfiles


### Setup
```
$ git clone git@github.com:Liquid-system/dotfiles.git
$ go install github.com/rhysd/dotfiles@latest
$ dotfiles link
$ aspell -d en dump master | aspell -l en expand | sed 's/\s\+/\n/g' > ~/.local/share/nvim/dictionary/en.dict
```

