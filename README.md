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
* [Installation](#Installation)
    * [Git](#git-installation)
    * [Lazygit](#lazygit-installation)
    * [Delta](#delta-installation)
    * [Neovim](#neovim-installation)
    * [Ripgrep](#ripgrep-installation)
    * [npm](#npm-installation)
    * [Treesitter](#tree-sitter-installation)

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
