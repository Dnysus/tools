# macOS Tools Installation

Automated setup script for macOS development environments.

## Compatibility

| macOS Version            | Tested |
| ------------------------ | ------ |
| macOS Sonoma (14.x)      | ✅     |
| macOS Ventura (13.x)     | ✅     |
| Apple Silicon (M1/M2/M3) | ✅     |

## What Gets Installed

- **Xcode Command Line Tools** - Required for development on macOS
- **Homebrew** - Package manager for macOS
- **Git** - Version control
- **Java 22 (OpenJDK)** - Java development kit
- **AWS CLI** - Amazon Web Services command line interface
- **Python 3.10** - Python programming language
- **Node.js** - JavaScript runtime
- **Gemini CLI** - CLI for Google Gemini
- **Google Cloud CLI** - CLI for Google Cloud Platform

## Usage

```bash
chmod +x install_tools.sh
./install_tools.sh
```

## Post-Installation

1. Run `source ~/.zprofile` to load environment variables in the current session
2. Restart your terminal for all PATH changes to take effect

## Verify Installations

```bash
brew --version
git --version
java -version
aws --version
python3.10 --version
node --version
gemini --version
gcloud --version
```

## Notes

- The script checks for existing installations before reinstalling
- Homebrew is configured for Apple Silicon (`/opt/homebrew`)
- Java is symlinked to the system Java directory
- Environment variables are added to `~/.zprofile`
