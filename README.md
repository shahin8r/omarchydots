# Omarchy dotfiles

Personal Omarchy configuration snapshots. Files are copied, not symlinked, so
Omarchy refreshes and migrations cannot accidentally modify this repository.
The repository mirrors `~/.config` directly under `.config/`.

## What is tracked

The portable allowlist is in `manifest`. Machine-specific monitor configuration
is deliberately not tracked.

Omarchy shell files, generated Chromium preferences, backups, sample files,
post-update hooks, and other application state are deliberately excluded.

## Daily workflow

Edit the active files normally under `~/.config`, then review and capture them:

```bash
./diff
./capture
git diff
git add .
git commit -m "Update dotfiles"
git push
```

`capture` only reads paths from the explicit manifest.

## Apply on this or another computer

Install Omarchy first, clone this repository, and preview the changes:

```bash
git clone <repository-url> ~/dev/omarchydots
cd ~/dev/omarchydots
./apply --dry-run
./apply
```

Changed destination files are backed up under
`~/.local/state/omarchydots/backups/`. The script refuses to replace symlinks.
