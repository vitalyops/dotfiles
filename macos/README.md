## macOS tiling window manager + linux meta keys + vim-like keybinds

Inspiration comes from maintaining linux like keybindings (ctrl for meta in macOS apps and also in the terminal) while being able to manage windows as close to i3wm as possible. Another benefit of this workflow is the reduced use of mouse due to vim-like keybinds.  

<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/scrot.png" alt="Yabai Window Manager">
</p>

### Prerequisites

This configuration assumes you're using an external keyboard (not Apple) with ctrl, super/win, alt keys, in that order. 

* `zsh` should be your default shell
* `karabiner-elements` should be installed, you can do so with `brew cask install karabiner-elements`
* install `brew cask install kitty` - a dotfile customizable, GPU accelerated terminal emulator. Unfortunatly, iTerm2 doesn't do either. 
* add brew tap for `yabai` (Window manager) and `skhd` (a keybind deamon) - `brew tap koekeishiya/formulae`
* `vimium` browser plugin is recommended to maintain vim-like keybinds and further mouse-reduced workflow

### Installation

__Disclaimer: For some of the more advanced features in Yabai, disbaling macOS SIP is required, however, we are not going to be doing that.__

#### Install yabai and skhd

```shell
brew install yabai
brew install skhd
```

#### Copy the contents of the dotfiles

Clone the repo and copy the contents of the macos dir in this repo to your $HOME folder

#### Install yabai and skhd (or compile from git repo) and then start them as services 

```shell
brew install yabai
brew install skhd
brew services start yabai
brew services start skhd
```

Make sure to grant macOS permissions to both when prompted

#### Additional tweaks in macOS


## Using the workflow

### Keybinds



