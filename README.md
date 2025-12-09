# dotfiles for macOS

## Requirements

- macOS Catalina (10.15) (or higher)
- `xcode-select --install`

## Initial setup

### git clone

`git clone https://github.com/hosht/dotfiles $HOME/works/src/github.com/hosht/dotfiles`

## mise

```
/bin/bash -c "$HOME/works/src/github.com/hosht/dotfiles/scripts/mise-installer.sh"
cd $HOME/works/src/github.com/hosht/dotfiles/.config/mise
$HOME/.local/bin/mise trust
$HOME/.local/bin/mise install
````

## dotter

```
cd $HOME/works/src/github.com/hosht/dotfiles/.config/mise
dotter deploy --force
```

### homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
brew bundle --global
```

## TODO

- [ ] Safari Preferences
- [ ] Key config: Caps Lock -> Left Ctrl
- [ ] Hide battery status in menu bar
- [ ] System Preferences -> Software Update -> Enable Install app updates from App Store
- [ ] Do Not Disturb
- [ ] Night Shift
- [ ] Disable auto correct with Kotoeri
