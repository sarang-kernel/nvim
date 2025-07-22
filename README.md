# Neovim Keybindings & Settings

Before Moving forward there are some pre-requisites that you should look out for : 1. Neovim (obviously) 2. Node (node.js/org) -> required for many packages so just do it

<!--toc:start-->

- [Neovim Keybindings & Settings](#neovim-keybindings-settings)
  - [Table of Contents](#table-of-contents)
  - [General Settings](#general-settings)
  - [Leader Key](#leader-key)
  - [Basic Custom Keybindings](#basic-custom-keybindings)
  - [Window Navigation and Resizing](#window-navigation-and-resizing)
    - [Moving Between Splits](#moving-between-splits)
    - [Resizing Splits](#resizing-splits)
  - [File Explorer (Neo-tree)](#file-explorer-neo-tree)
  - [Language Server (LSP)](#language-server-lsp)
  - [Code Formatting](#code-formatting)
  - [Autocomplete (nvim-cmp)](#autocomplete-nvim-cmp)
  - [Debugger (nvim-dap)](#debugger-nvim-dap)
  - [Git Integration (gitsigns)](#git-integration-gitsigns)
  - [Fuzzy Finder (Telescope)](#fuzzy-finder-telescope)
  - [Built-in Vim Keybindings](#built-in-vim-keybindings)
  - [Markdown Rendering](#markdown-rendering)
    - [Headers: Visual Structure](#headers-visual-structure)
  - [Tips and Notes](#tips-and-notes)
  <!--toc:end-->

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

## Markdown Rendering

This setup is to make Markdown notes beautiful and information-dense without any external tools. the features are triggered automatically by the syntax you type.

### Headers: Visual Structure

Distinct icons are added to each heading level for a clear visual hierarchy.

| What you type | What you see |
| :------------ | :----------- |
| `# Title`     | `󰎤 Title`    |
| `## Section`  | `󰎧 Section`  |
| `### Topic`   | `󰎪 Topic`    |

### Links: Your Information Hub

Links are rendered with icons that tell you what they point to.

| Link Type           | What you type        | Example Result                          |
| :------------------ | :------------------- | :-------------------------------------- |
| **Living WikiLink** | `[[My Note]]`        | `󱗖 12.3KB \| 󰥔 2h ago` (if file exists) |
| **Broken WikiLink** | `[[Bad Link]]`       | `󰅖 Missing` (if file doesn't exist)     |
| **GitHub**          | `[Repo](github.com)` | `󰊤 Repo`                                |
| **Arxiv Paper**     | `[Paper](arxiv.org)` | `󰎠 Paper`                               |
| **OWASP**           | `[Info](owasp.org)`  | `󰓮 Info`                                |
| **Image**           | `![Alt](img.png)`    | `󰥶 Alt`                                 |

> **Note:** The "Living WikiLink" feature requires you to set the correct path to your notes folder in the plugin's configuration.

### Task Lists: The "Kanban" System

Your task lists are now a mini project management tool with different states.

| Status          | What you type          | What you see |
| :-------------- | :--------------------- | :----------- |
| **To Do**       | `- [ ]` (with a space) | `󰄱`          |
| **Done**        | `- [x]`                | `󰱒`          |
| **In Progress** | `- [-]`                | `󰥔`          |
| **Blocked**     | `- [b]`                | `󰹆`          |
| **Delegated**   | `- [d]`                | `󰆴`          |
| **Question**    | `- [?]`                | `󰘥`          |
| **Idea**        | `- [i]`                | `󰌶`          |

### Ordered Lists: Context-Aware Markers

Ordered lists change their markers based on content or level.

| What you type                 | Example Result                            |
| :---------------------------- | :---------------------------------------- |
| `1. First item`               | `I. First item` (uses Roman numerals)     |
| `2. Review notes DUE: Friday` | `󰥔 Review notes DUE: Friday` (clock icon) |
| `3. Task is DONE`             | `󰱒 Task is DONE` (checkmark icon)         |

### Callouts: Semantic Highlighting

Use special keywords in blockquotes to create beautifully highlighted admonition boxes for different contexts.

| Category          | Keyword          | Example Result                        |
| :---------------- | :--------------- | :------------------------------------ |
| **General**       | `> [!NOTE]`      | A blue box with `󰋽 Note`              |
|                   | `> [!WARNING]`   | An orange box with `󰀪 Warning`        |
| **Academic**      | `> [!DEF]`       | A highlighted box with `󰙰 Definition` |
|                   | `> [!THM]`       | A green box with `󰔷 Theorem`          |
| **Cybersecurity** | `> [!RECON]`     | A blue box with `󰄛 1. Recon`          |
|                   | `> [!EXPLOIT]`   | A red box with `󰯐 4. Exploit`         |
| **Code**          | `> [!VULN-CODE]` | A red                                 |

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
