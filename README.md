# Homebrew tap for dblitz

[dblitz](https://github.com/tstone-1/dblitz) is a fast read-only SQLite browser.

## Install

```
brew install --cask tstone-1/dblitz/dblitz
```

That's the short form. The expanded version is:

```
brew tap tstone-1/dblitz
brew install --cask dblitz
```

Homebrew strips the macOS quarantine attribute on cask installs, so the app opens normally — no `xattr` step needed.

## Update

```
brew upgrade --cask dblitz
```

## Uninstall

```
brew uninstall --cask dblitz             # remove the app
brew uninstall --cask --zap dblitz       # also delete per-file view config and preferences
```

## License

MIT — see [LICENSE](./LICENSE).
