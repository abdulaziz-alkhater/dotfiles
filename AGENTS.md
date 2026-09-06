# AGENTS.md

Cross-machine **dotfiles** repo (Linux/Omarchy + macOS), mostly read-only config. It is NOT a Neovim-only repo — Neovim is just one of ~20 packages. Read this before editing.

## Layout & deploy

- **Repo root mirrors `$HOME`.** Each top-level dir is a deploy unit whose contents are paths relative to `$HOME`. e.g. `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`, `avatar/.face` → `~/.face`, `zshrc/.zshrc` → `~/.zshrc`.
- **Deploy is manual, via GNU Stow (documented convention).** No installer, Makefile, CI, or pre-commit hooks exist here. Because contents start with `.config`/`.zshrc`/`.face`, Stow needs `--dotfiles`. Intended pattern (run by hand, not scripted): `stow --dotfiles --target="$HOME" <pkg>` from the repo root.
- **Edits don't take effect on their own.** A change does nothing until it lands at its `~` path AND the owning app/service reloads or restarts. If deployed as symlinks (Stow default), editing the repo file edits the live file; if copied, redeploy first.

## Two platforms — edit the right tree

- **Linux (Omarchy/Arch, Wayland):** `hypr`, `waybar`, `rofi`, `swayosd`, `mako`, `kitty`, `alacritty`, `ghostty`, `wezterm`, `tmux`, `yazi`, `kanata`, `scripts`, `nvim`, `avatar`.
- **macOS:** everything under `mac/` (aerospace, kanata, `.zshrc`).
- Some tools exist on both with **separate, non-synced** copies (`zshrc/.zshrc` vs `mac/.zshrc`; `kanata/` vs `mac/.config/kanata/`). `mac/.zshrc` even leaks Linux `/home/abdulaziz/...` paths — these are real footguns, not bugs to "unify" without checking.
- If your session is macOS (like this repo's working dir), most of the Linux/Wayland stack can't be launched or verified locally — validate by inspection.

## Footguns before you edit

- **Ghostty has two diverged configs.** Canonical (the one Ghostty reads) is `ghostty/.config/ghostty/config` → `~/.config/ghostty/config`. The stray `ghostty/config` deploys to `~/config` (unused) and disagrees with it — edit the `.config` one.
- **Neovim: only `nvim/.config/nvim` is live.** `nvim.mycustom/` and `nvim.old/` are archived alternates. `*.old`, `*.bak`, and `Untitled` files are stale backups, never loaded.
- **Vendored / tool-managed — don't hand-edit** (overwritten on reinstall): `kitty/.config/kitty/kitty-themes/` (vendored clone), `tmux/.config/tmux/plugins/` (TPM plugins; `tmux.conf` installs them via `~/.tmux/plugins/tpm`), `yazi/.config/yazi/flavors/` + `plugins/` (fetched by `ya pack`, pinned in `package.toml` by rev+hash).
- **Hyprland is layered on Omarchy, not self-contained.** `hypr/.config/hypr/hyprland.conf` `source`s `~/.local/share/omarchy/default/hypr/*` and `~/.config/omarchy/current/theme/*` (an Omarchy-managed symlink). Most base config lives OUTSIDE this repo; these files are overrides. Don't judge or test Hyprland from this repo alone.
- **Out-of-repo files are assumed present.** `zshrc/.zshrc` sources `~/.config/api/api_keys.sh` (mac: `~/.api-keys.sh`) for secrets, and mac expects an oh-my-posh theme at `~/.config/oh-my-posh/themes/amro.omp.json`. None are tracked — don't assume the repo is self-sufficient, and never commit real secrets.
- **Kanata runs as a service.** Linux: systemd `kanata.service` (ExecStart pins `tokyo60.kbd`; other `*.kbd` are per-keyboard and must be switched manually). macOS: launchd `com.example.kanata.plist`. Editing a `.kbd` requires restarting the service/agent.

## Verify / reload (no repo-wide test harness)

There are no `npm test`/`make`/CI steps. Verify by reloading the target app:
- **Lua (nvim):** format with `stylua` (2-space, 120-col — `nvim/.config/nvim/stylua.toml`); then `:checkhealth` / `:Lazy sync` inside Neovim.
- **Waybar:** `waybar --validate`, then reload with `killall -HUP waybar`. `scripts/.local/scripts/launch-waybar` auto-restarts on `~/.config/waybar/*` edits (deploy it to `~/.local/scripts`, which zshrc adds to `$PATH`).
- **Shell:** zshrc uses Zinit; a syntax check like `zsh -n <file>` is the cheap smoke test.
- House style for Lua/JSONC/CSS is **2-space indentation**.

## Conventions

- Commit messages: **conventional commits** (`type: summary`). Branches: `feature/`, `fix/`, `docs/`, `refactor/`.
- Deeper per-tool guidance lives next to the config — consult it before rewriting style opinions: `nvim/.config/nvim/CLAUDE.md` (LazyVim/plugin patterns) and `waybar/.config/waybar/AGENTS.md` (waybar JSONC/CSS).
