## macOS tiling window manager + linux meta keys + vim-like keybinds

Inspiration comes from maintaining linux-like key bindings (ctrl for meta in macOS apps and also in the terminal) while being able to manage windows as close to i3wm as possible. Another benefit of this workflow is the reduced use of mouse due to vim-like keybinds.  

<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/scrot.png" alt="Yabai Window Manager">
</p>

### Prerequisites

This configuration assumes you're using an external keyboard (not Apple) with ctrl, super/win, alt keys, in that order. 

* `zsh` should be your default shell
* `karabiner-elements` should be installed, you can do so with `brew cask install karabiner-elements`
* install `brew cask install kitty` - a dotfile customizable, GPU accelerated terminal emulator. Unfortunatly, iTerm2 doesn't do either. 
* add brew tap for `yabai` (Window manager) and `skhd` (a keybind deamon) - `brew tap koekeishiya/formulae`
* alfred should be installed to launch applications, I use alt+d for its hotkey
* `vimium` browser plugin is recommended to maintain vim-like keybinds and further mouse-reduced workflow

### Installation

__Disclaimer: For some of the more advanced features in Yabai, disabling macOS SIP is required, however, we are not going to be doing that.__

#### Install yabai and skhd (or compile from git repo)

```shell
brew install yabai
brew install skhd
```

#### Copy the contents of the dotfiles

Clone the repo and copy the contents of the macos dir to your $HOME folder

#### Start yabai and skhd as services and kill Dock process

```shell
brew services start yabai
brew services start skhd
killall Dock
```

Make sure to grant macOS permissions to both when prompted

#### Perform additional tweaks in macOS
<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/accessibility_display.png" alt="Accessibility Display Settings">
</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/keybinds_mission_control.png" alt="Mission Control Keybinds">
</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/macos_meta_modifiers.png" alt="macOS meta keys modifiers">
</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/vitaliko/dotfiles/main/macos/screenshots/mission_control_settings.png" alt="Mission Control Settings">
</p>

## Using the workflow

### Keybinds

General system keybinds will follow linux/windows convention with ctrl + <key> taking over instead of cmd + <key>. This also works for text maninuplation in macOS, with alt + arrow, alt + backspace. Ctrl is the primay meta in kitty, meaning Ctrl+C will send interrupt signal and not copy.
  
You might need to make sure you have 4 workspaces open in Mission Control already. 

#### Yabai Window Manager 

Checkout the configs for more keybinds, but this should be sufficient to get started:

alt + 1..4 - change focus between workspaces
shift + alt + 1..4 - throw focused tile to workspace 1..4
alt + hjkl - move focus between windows within workspaces
shift + alt + hjkl - move windows within workspaces
shift + alt + e - change layout
alt + mouse2 + drag - resize the windows manually


#### Kitty/Terminal

Ctrl acts as the primary meta in terminal, like in a linux shell. 

alt + enter - when kitty is focused this will spawn a new terminal window (ideally this should happen from anywhere in the OS, work in progress) 
shift + alt + q - close kitty window (ideally this should be a global shortcut to close any single window, work in progress)
ctrl + shift + c - copy to OS buffer from within terminal (the highlighting needs to be improved)
ctrl + shift + v - paste from OS buffer in terminal
