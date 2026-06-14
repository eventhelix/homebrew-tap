# EventHelix Homebrew Tap

Homebrew tap for [EventHelix](https://www.eventhelix.com) products on macOS
(Apple Silicon / arm64).

## Usage

```sh
brew install eventhelix/tap/<product>
```

`brew` expands `eventhelix/tap` to this repository (`eventhelix/homebrew-tap`).

## Available formulae

| Product | Install |
|---|---|
| [VisualEther](https://www.eventhelix.com/visualether) — sequence diagrams from Wireshark PCAPs | `brew install eventhelix/tap/visualether` |

Additional EventHelix products are published here as separate formulae over
time (e.g. `brew install eventhelix/tap/eventstudio`).

## Notes

- **Apple Silicon (arm64) only.** Intel Macs are not supported; formulae declare
  `depends_on arch: :arm64` and will report this rather than install a broken
  binary.
- Binaries are downloaded from EventHelix's signed download origin
  (`downloads.eventhelix.com`).
- VisualEther depends on the Wireshark CLI (`tshark`), installed automatically.
