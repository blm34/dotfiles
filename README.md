# Dotfiles

Configuration files for various tools.

[Configs](#configs) lists details of tools that have their configuration managed
here. [Installation](#installation) gives details of how each of these tools
(and its dependencies can be installed). To load the configuration for all
tools, run `install.ps1` in PowerShell, or `install.sh` in bash.

## Contents

* [Configs](#Configs)
    * [Neovim](#Neovim)
    * [Git](#Git)
    * [Lazygit](#lazygit)
    * [Yazi](#yazi)
    * [PowerShell](#powershell)
* [Installation](#Installation)
    * [Git](#git-installation)
    * [Lazygit](#lazygit-installation)
    * [Delta](#delta-installation)
    * [Neovim](#neovim-installation)
    * [Ripgrep](#ripgrep-installation)
    * [npm](#npm-installation)
    * [Treesitter](#tree-sitter-installation)
    * [fd](#fd-installation)
    * [yazi](#yazi-installation)
    * [file](#file-installation)
    * [ffmpeg](#ffmpeg-installation)
    * [7-Zip](#7-zip-installation)
    * [jq](#jq-installation)
    * [poppler](#poppler-installation)
    * [fzf](#fzf-installation)
    * [zoxide](#zoxide-installation)
    * [resvg](#resvg-installation)
    * [ImageMagick](#imagemagick-installation)

## Configs

### Neovim

For full documentation see [Neovim Readme](config/neovim/README.md).

Config sets up keymaps and plugins.

<details>
    <summary>
        Dependencies
    </summary>

* [Neovim](#neovim-installation)
* [Git](#git-installation)
* [Ripgrep](#ripgrep-installation)
* [Lazygit](#lazygit-installation)
* [npm](#npm-installation)
* [Tree Sitter](#tree-installation)
* [fd](#fd-installation)
</details>

### Git

Config sets up default behaviour, diff/merge tools, and some aliases.

<details>
    <summary>
        Dependencies
    </summary>

* [Git](#git-installation)
* [Neovim](#neovim-installation)
* [Delta](#delta-installation)
</details>

### Lazygit

Config sets the colour scheme and the interface into other tools (e.g. for
diff).

<details>
    <summary>
        Dependencies
    </summary>

* [Lazygit](#lazygit-installation)
* [Git](#git-installation)
* [Delta](#delta-installation)
</details>

### Yazi

<details>
    <summary>
        Dependencies
    </summary>

* [yazi](#yazi-installation)
* [file](#file-installation)
* [ffmpeg](#ffmpeg-installation)
* [7-Zip](#7-zip-installation)
* [jq](#jq-installation)
* [poppler](#poppler-installation)
* [fd](#fd-installation)
* [rg](#ripgrep-installation)
* [fzf](#fzf-installation)
* [zoxide](#zoxide-installation)
* [resvg](#resvg-installation)
* [ImageMagick](#image-magick-installation)
</details>

### PowerShell

Set up aliases and functions. Only installed on Windows.

## Installation

### Git Installation

Details found on [Git's website](https://git-scm.com)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install --id Git.Git -e --source winget
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S git
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

```bash
apt install git
```
</details>

### Lazygit Installation

Details found on [Lazygit's github](https://github.com/jesseduffield/lazygit)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install -e --id=JesseDuffield.lazygit
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S lazygit
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

```bash
apt install lazygit
```
</details>

### Delta Installation

Details found on [Delta's github](https://github.com/dandavison/delta)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install dandavison.delta
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S git-delta
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

Install the relevant .deb file from the
[releases](https://github.com/dandavison/delta/releases) page and run the
following command (substituting *file.deb* with the name of the file).

```bash
dpkg -i file.deb
```
</details>

### Neovim Installation

Details found on [Neovim's github](https://github.com/neovim/neovim/)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install Neovim.Neovim
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S neovim
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

```bash
apt install neovim
```
</details>


### Ripgrep Installation

Details found on [Ripgrep's github](https://github.com/BurntSushi/ripgrep)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install BurntSushi.repgrep.MSVC
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S ripgrep
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

Identify the relevant .deb file from the
[releases](https://github.com/BurntSushi/ripgrep/releases) page and download and
install it using the following commands following command (substituting
*file.deb* with the name of the file).

```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/<version>/file.deb
sudo dpkg -i file.deb
```
</details>

### npm Installation

Details found on npm's [docs](https://docs.npmjs.com/) page.

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install -e --id OpenJS.NodeJS.LTS
```
</details>

<details>
    <summary>
        Arch
    </summary>

Check [Node Version Manager](https://github.com/nvm-sh/nvm) for the latest
version and substitute it into the following command

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

Confirm successful installation with

```bash
command -v nvm
```

Install the latest version of npm with

```bash
nvm install node
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

```bash
sudo apt install nodejs
```
</details>

### Tree Sitter Installation

Details found on [tree-sitter's github](https://github.com/tree-sitter/tree-sitter)

Install with npm:

```
npm install tree-sitter-cli
```

### fd Installation

Details found on [fd's github](https://github.com/sharkdp/fd).

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install -e --id sharkdp.fd
```
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
pacman -S fd
```
</details>

<details>
    <summary>
        Ubuntu
    </summary>

```bash
apt install fd-find
```

The default binary is called `fdfind` as `fd` is used by another package. After
installation run

```bash
ln -s $(which fdfind) ~/.local/bin/fd
```

to use `fd`. (Ensure `$Home/.local/bin` is in `$PATH`).
</details>

### Yazi Installation

Details found in [Yazi's docs](https://yazi-rs.github.io/docs/installation)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install sxyazi.yazi
```

To use `file(1)` add `<Git_Installed_Directory>\usr\bin\file.exe` to the
`YAZI_FILE_ONE` environment variable.
</details>

<details>
    <summary>
        Arch
    </summary>

```bash
sudo pacman -S yazi
```
</details>

### File Installation

<details>
    <summary>
        Windows
    </summary>

Easiest method is to install [git-for-windows](#git-installation) and use the
exe that comes with that.
</details>

### FFmpeg Installation

Details found on [FFmpeg's website](https://www.ffmpeg.org/download.html)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install Gyan.FFmpeg
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S ffmpeg
```
</details>

### 7-Zip Installation

Details found on [7-Zip's website](https://www.7-zip.org/download.html)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install 7zip.7zip
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S 7zip
```
</details>

### jq Installation

Details found on [jq's website](https://jqlang.org)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install jqlang.jq
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S jq
```
</details>


### Poppler Installation

Details found on [Poppler's website](https://poppler.freedesktop.org)


<details>
    <summary>
        Windows
    </summary>

```powershell
winget install oschwartz10612.Poppler
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S poppler
```
</details>

### fzf Installation

Details found on [fzf's github](https://github.com/junegunn/fzf)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install junegunn.fzf
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S fzf
```
</details>

### Zoxide Installation

Details found on [Zoxide's github](https://github.com/ajeetdsouza/zoxide)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install ajeetdsouza.zoxide
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S zoxide
```
</details>

### resvg Installation

Details found on [resvg's github](https://github.com/linebender/resvg)

<details>
    <summary>
        Windows
    </summary>

Must be installed from [github releases](https://github.com/linebender/resvg/releases)
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S resvg
```
</details>

### ImageMagick Installation

Details found on [ImageMagick's website](https://imagemagick.org)

<details>
    <summary>
        Windows
    </summary>

```powershell
winget install ImageMagick.ImageMagick
```
</details>

<details>
    <summary>
        Arch
    </summary>

```powershell
sudo pacman -S imagemagick
```
</details>

