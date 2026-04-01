# Tools Repository

Automated setup scripts for development environments across different operating systems.

## Structure

| Directory        | Description                                           |
| ---------------- | ----------------------------------------------------- |
| [macos/](macos/) | Setup scripts for macOS (Apple Silicon)               |
| [linux/](linux/) | Setup scripts for Debian-based Linux (x86_64 & ARM64) |

## Quick Start

### macOS

```bash
chmod +x macos/install_tools.sh
./macos/install_tools.sh
```

**Installs:** Xcode CLI Tools, Homebrew, Git, Java 22, AWS CLI, Python 3.10, Node.js, Gemini CLI, Google Cloud CLI

### Linux (x86_64)

```bash
chmod +x linux/install_tools_x86.sh
./linux/install_tools_x86.sh
```

### Linux (ARM64 / Raspberry Pi)

```bash
chmod +x linux/install_tools_arm64.sh
./linux/install_tools_arm64.sh
```

**Installs:** Git, curl, NVM, Node.js (LTS & v20), Serverless Framework, fastfetch, Docker, AWS CLI v2

## Compatibility

| OS                                   | Tested |
| ------------------------------------ | ------ |
| macOS Sonoma/Ventura (Apple Silicon) | ✅     |
| Raspberry Pi OS 64-bit Lite          | ✅     |
| Debian 13 (Trixie)                   | ✅     |
| Ubuntu 22.04+                        | ✅     |

## License

MIT License - see [LICENSE](LICENSE) for details.
