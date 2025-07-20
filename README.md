# Neovim Keybindings & Settings

---

## Table of Contents

- [General Settings](#general-settings)
- [Leader Key](#leader-key)
- [Basic Custom Keybindings](#basic-custom-keybindings)
- [Window Navigation and Resizing](#window-navigation-and-resizing)
- [File Explorer (Neo-tree)](#file-explorer-neo-tree)
- [Language Server (LSP)](#language-server-lsp)
- [Code Formatting](#code-formatting)
- [Autocomplete (nvim-cmp)](#autocomplete-nvim-cmp)
- [Debugger (nvim-dap)](#debugger-nvim-dap)
- [Git Integration (gitsigns)](#git-integration-gitsigns)
- [Fuzzy Finder (Telescope)](#fuzzy-finder-telescope)
- [Built-in Vim Keybindings](#built-in-vim-keybindings)
- [Tips and Notes](#tips-and-notes)

---

## General Settings

These change how Neovim behaves by default:

```lua
vim.cmd("set expandtab")       -- Use spaces instead of tabs
vim.cmd("set tabstop=2")       -- Number of spaces a tab shows as
vim.cmd("set softtabstop=2")   -- Number of spaces inserted when you press Tab
vim.cmd("set shiftwidth=2")    -- Spaces used for auto-indent
vim.cmd("set number")          -- Show line numbers on the left
```

---

## Leader Key

The leader key is a custom key you press first before shortcuts. In your setup:

```lua
vim.g.mapleader = " "          -- Space is the leader key
vim.g.maplocalleader = "//"    -- Local leader (used less often)
```

So `<leader>w` means: press **Space**, then **w**.

---

## Basic Custom Keybindings

| Mode | Keys        | Description                              |
| ---- | ----------- | ---------------------------------------- |
| `n`  | `<leader>w` | Save the current file                    |
| `n`  | `<leader>q` | Quit the current window                  |
| `n`  | `<leader>x` | Save and quit                            |
| `n`  | `<leader>h` | Clear search highlight from previous `/` |
| `n`  | `<leader>?` | Show available keybindings (which-key)   |
| `i`  | `jk`        | Exit insert mode (instead of Esc)        |

Tip: `<leader>?` is especially helpful when you forget keybindings — it gives you a menu of available ones.

---

## Window Navigation and Resizing

### Moving Between Splits

| Mode | Keys    | Description               |
| ---- | ------- | ------------------------- |
| `n`  | `<C-h>` | Move to split on the left |
| `n`  | `<C-l>` | Move to the right         |
| `n`  | `<C-j>` | Move down                 |
| `n`  | `<C-k>` | Move up                   |

### Resizing Splits

| Keys        | Description     |
| ----------- | --------------- |
| `<C-Up>`    | Decrease height |
| `<C-Down>`  | Increase height |
| `<C-Left>`  | Decrease width  |
| `<C-Right>` | Increase width  |

---

## File Explorer (Neo-tree)

| Keys        | Description        |
| ----------- | ------------------ |
| `<leader>e` | Toggle file tree   |
| `<leader>+` | Make tree wider    |
| `<leader>-` | Make tree narrower |

---

## Language Server (LSP)

The language server adds smart features like go-to-definition and code actions.

| Keys         | Description                           |
| ------------ | ------------------------------------- |
| `K`          | Show info about symbol under cursor   |
| `gd`         | Go to definition                      |
| `<leader>ca` | Code actions (like rename, fix, etc.) |

---

## Code Formatting

| Keys         | Description             |
| ------------ | ----------------------- |
| `<leader>gf` | Format the current file |

---

## Autocomplete (nvim-cmp)

Used when typing in insert mode.

| Mode | Keys        | Description                      |
| ---- | ----------- | -------------------------------- |
| `i`  | `<C-Space>` | Open suggestion menu             |
| `i`  | `<C-b>`     | Scroll suggestion docs up        |
| `i`  | `<C-f>`     | Scroll suggestion docs down      |
| `i`  | `<C-e>`     | Close the suggestion menu        |
| `i`  | `<CR>`      | Confirm the selected suggestion  |
| `i`  | `<Tab>`     | Next item or snippet placeholder |
| `i`  | `<S-Tab>`   | Previous item or placeholder     |

---

## Debugger (nvim-dap)

These keybindings help you debug code (if set up).

| Keys         | Description           |
| ------------ | --------------------- |
| `<leader>db` | Toggle breakpoint     |
| `<leader>dc` | Continue execution    |
| `<leader>do` | Step over (next line) |
| `<leader>di` | Step into function    |
| `<leader>du` | Step out of function  |

---

## Git Integration (gitsigns)

| Keys         | Description                |
| ------------ | -------------------------- |
| `]c` / `[c`  | Go to next/previous change |
| `<leader>hs` | Stage the current hunk     |
| `<leader>hr` | Reset the current hunk     |
| `<leader>hP` | Preview the current hunk   |
| `<leader>hb` | Git blame for current line |

---

## Fuzzy Finder (Telescope)

Used to search and navigate quickly.

| Keys         | Description               |
| ------------ | ------------------------- |
| `<leader>ff` | Find files                |
| `<leader>fg` | Search for text in files  |
| `<leader>fb` | Show open buffers         |
| `<leader>fh` | Search help/documentation |

---

## Built-in Vim Keybindings

These are standard Vim shortcuts — very useful to learn.

| Mode | Keys          | Description                        |
| ---- | ------------- | ---------------------------------- |
| `n`  | `:w`          | Save the file                      |
| `n`  | `:q`          | Quit the window                    |
| `n`  | `:wq`         | Save and quit                      |
| `n`  | `:qa`         | Quit all windows                   |
| `n`  | `:e filename` | Open a file                        |
| `n`  | `u`           | Undo                               |
| `n`  | `<C-r>`       | Redo                               |
| `n`  | `/text`       | Search for "text"                  |
| `n`  | `n` / `N`     | Next / previous search match       |
| `n`  | `dd`          | Delete current line                |
| `n`  | `yy`          | Copy current line                  |
| `n`  | `p`           | Paste below current line           |
| `n`  | `x`           | Delete character under the cursor  |
| `n`  | `0` / `^`     | Move to start of line / first word |
| `n`  | `$`           | Move to end of line                |
| `n`  | `gg` / `G`    | Start / end of file                |
| `n`  | `w` / `b`     | Next / previous word               |
| `n`  | `%`           | Jump to matching bracket or tag    |
| `n`  | `.`           | Repeat last change                 |
| `v`  | `>` / `<`     | Indent / un-indent selected text   |

---

## Tips and Notes

- `<leader>` is the Space key in your setup.
- Use `jk` in insert mode to go back to normal mode quickly.
- Combine commands with motions. For example:
  - `d$` = delete from cursor to end of line
  - `yG` = copy from cursor to end of file
  - `c3w` = change the next 3 words

- Use `:vsp filename` to open a file in a vertical split.
- Press `<leader>?` to see a menu of available keybindings (which-key).
- Use `:help <command>` (like `:help gg`) to get Vim help directly.
