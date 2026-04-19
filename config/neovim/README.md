# Neovim Config

Neovim configuration should be located at:

| OS          | Path                 |
|-------------|----------------------|
| **Windows** | ~/Appdata/Local/nvim |
| **Linux**   | ~/.config/nvim       |

## Prerequisites

* [Neovim](https://neovim.io) (>=0.12)
* [git](https://git-scm.com/downloads)
* [Ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
* [LazyGit](https://github.com/jesseduffield/lazygit)
* [npm](https://nodejs.org/en/download/)
* [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)

### Python

To debug python code, a virtual environment must exist at `~/.virtualenvs/debugpy`
which has debugpy installed into it.

## Keymaps

`<leader>` is mapped to `<space>`

`<localleader>` is mapped to `\`

[Whichkey](https://github.com/folke/which-key.nvim) is used to hint keymaps as
they are typed. Keymaps are sorted into namespaces where appropriate.

### Namespaces

| Namespace | Description |
|-----------|-------------|
| `<leader>c` | LSP functionality (Code) |
| `<leader>d` | Debug |
| `<leader>g` | Git |
| `<leader>h` | Harpoon |
| `<leader>q` | Quickfix list |
| `<leader>r` | Code Runners |
| `<leader>s` | Search with telescope |
| `<leader>t` | Running tests |
| `<leader>w` | Tab management (workspace) |

### Useful Keymaps

#### Config Management

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n | `<leader>L` | Open Lazy plugin manager | Lazy |
| n | `<leader>M` | Open Mason manager | Mason |

#### UI

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n | `<leader>gg` | Open Lazygit | Git |
| n | `<leader>o` | Open Oil in a floating window | Oil |
| n | `<leader>ut` | Toggle the undotree window | Undo tree |
| n | `<leader>v` | Open vista window for code structure | Vista |

#### Editing

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| v | `J` | Move selection down | |
| v | `K` | Move selection up | |
| n & x | `<leader>p` | Paste from system clipboard | Paste |
| n & x | `<leader>y` | Copy to system clipboard | Yank |
| n | `yss}` | Surround the entire line with {} | You surround |
| v | `Sb` | Surround the selection with the brackets | Surround |
| n | `gc` | Comment the following noun | Give comment |
| n | `gcc` | Comment the current line | Give current comment |
| n | `dgc` | Delete the comment block | |
| n | `<leader>i` | Toggle the word under the cursor (e.g. True -> False) | Invert |
| n | `<CR>` | Jump to a location using Flash | Search |
| n | `z=` | Show spelling suggestions with which-key | |

#### Visual

| Mode | Keymap | Action |
|------|--------|--------|
| n | `<ESC>` | Turn off highlight search |

#### Window Management

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n & t | `<M-h>` | Move to window to the left | |
| n & t | `<M-l>` | Move to window to the right | |
| n & t | `<M-j>` | Move down one window | |
| n & t | `<M-k>` | Move up one window | |
| n | `<CM-h>` | Decrease window width | |
| n | `<CM-l>` | Increase window width | |
| n | `<CM-j>` | Decrease window height | |
| n | `<CM-k>` | Increase window height | |
| t | `<ESC>` | Exit terminal mode (to normal mode) | |
| n | `<leader>1` | Toggle terminal 1 (valid for 1-9) | |

#### LSP

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n | `gd` | Go to definition | Go definition |
| n | `gD` | Go to declaration | Go declaration |
| n | `gr` | Add references to qfl | Go references |
| n | `gi` | Go to implementation | Go implementation |
| n | `gt` | Go to type definition | Go type |
| n | `<leader>cr` | Rename variable | Code Rename |
| n | `<leader>ca` | Code action | Code action | 
| n | `<leader>cf` | Format the file | Code format | 
| n | `<leader>caf` | Toggle format on save | Code auto format |
| n | `<leader>D` | Toggle diagnostics |

#### Completions

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| i | `<C-j>` | Select next in drop down | Down |
| i | `<C-k>` | Select previous in drop down | Up |
| i | `<C-y>` | Confirm selection (only required for snippets) | Yes |
| i | `<C-e>` | Abort completion and close menu | Exit |
| i | `<C-l>` | Jump to next input of snippet | Left |
| i | `<C-h>` | Jump to previous input of snippet | Right |

#### Hover

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n | `K` | Open hover | |
| n | `gK` | Enter hover | |
| n | `<C-p>` | Previous hover | Previous |
| n | `<C-n>` | Next hover | Next |

#### Telescope

In a telescope search window the following maps apply

| Mode | Keymap | Action | Mnemonic |
|------|--------|--------|----------|
| n & i | `<CR>` | Open in current buffer | |
| n | `s` | Open in horizontal split | Split |
| n | `v` | Open in vertical split | Vertical |
| n | `t` | Open in new tab | Tab |
