# Gideon Theme (oh-my-zsh)

This is a custom oh-my-zsh theme that was inspired by my prior AIX and Bash prompt setups along with the [avit.zsh-theme](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/avit.zsh-theme).

## Screenshots

The following screenshot shows you the theme and custom prompt in action with the GIT plugin included. The prompt provides the host, IP address, and path you are current in along with the branch, status and last touch times (pulled from the avit theme).

![gideon-screenshot](./screenshots/gideon-screenshot.png?raw=true "Gideon Screenshot")

## Installation Steps

1. Clone this repo into the `~/.oh-my-zsh/custom/themes` directory by using the following command.
```sh
git clone https://github.com/userhiren/oh-my-zsh-gideon-theme ~/.oh-my-zsh/custom/themes/oh-my-zsh-gideon-theme
```
2. Next setup a symbolic link to the themes directory.
```sh
ln -s ~/.oh-my-zsh/custom/themes/oh-my-zsh-gideon-theme/gideon.zsh-theme ~/.oh-my-zsh/themes/gideon.zsh-theme
```
3. Update your `~/.zshrc` file, updating the `ZSH_THEME` property to `gideon`.

## For Updates

If you want to pull the latest fixes or enhancements for the future you can run the following commands.
```sh
cd ~/.oh-my-zsh/custom/themes/oh-my-zsh-gideon-theme
git pull
```

## Future Enhancements

- Clean up IP address resolution so that it is smart cached and also handles multiple platforms and adapters.