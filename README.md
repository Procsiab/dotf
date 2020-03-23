# Procsiab Dotfiles

Custom dotfiles and configurations for my workstation setup

## Installation

The dotfiles inside this repository are meant to be managed by GNU Stow; to install all configurations at once run the following command:

```bash
stow *
```

You should be inside this repository's directory when running the previous command; to install the configuration for a single program/tool (refer to the folder names) use instead:

```bash
stow <folder_name>
```

Where `folder_name` it's the name of a folder inside the top level of this repository.

## Removal

Change working directory inside this repository and run the command:

```bash
stow -D
```

## Notes

You will need to install the `stow` tool; after using it, you will still need to perform the following steps, to use all of the configurations provided:
- install NeoVIM's plug-ins with the `PluginInstall` command,
- install the *EN\_GB* and *IT* dictionaries within NeoVIM,
- install `zsh` shell to use its configurations,
- install `oh-my-zsh` plug-in to use its theme
- install `rofi`,
- install `taskwarrior`,
- install `tilix` terminal emulator,
- install `tmux` session manager,
- install `zathura` PDF reader.
