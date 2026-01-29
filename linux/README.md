# Linux Tools Installation

Automated setup scripts for Debian-based Linux distributions.

## Scripts

| Script                   | Architecture  | Use Case                    |
| ------------------------ | ------------- | --------------------------- |
| `install_tools_x86.sh`   | x86_64        | Standard PCs, servers, VMs  |
| `install_tools_arm64.sh` | ARM64/aarch64 | Raspberry Pi 5, ARM servers |

## Compatibility

| Distribution                | x86_64 | ARM64 |
| --------------------------- | ------ | ----- |
| Raspberry Pi OS 64-bit Lite | -      | ✅    |
| Debian 13 (Trixie)          | ✅     | ✅    |
| Ubuntu 22.04+               | ✅     | ✅    |

## What Gets Installed

- **Git** - Version control
- **curl** - File transfer utility
- **NVM** - Node Version Manager (v0.39.7)
- **Node.js** - LTS and v20
- **Serverless Framework** - AWS Lambda deployment tool
- **fastfetch** - System information tool
- **Docker** - Container runtime
- **AWS CLI v2** - Amazon Web Services CLI

## Usage

### For x86_64 systems:

```bash
chmod +x install_tools_x86.sh
./install_tools_x86.sh
```

### For ARM64 systems (Raspberry Pi):

```bash
chmod +x install_tools_arm64.sh
./install_tools_arm64.sh
```

## Post-Installation

1. **Log out and back in** (or reboot) for Docker group changes to take effect
2. Run `source ~/.bashrc` to use NVM in the current session

## Verify Installations

```bash
git --version
node --version
npm --version
serverless --version
fastfetch
docker --version
aws --version
```

## Notes

- Scripts check for existing installations before reinstalling
- NVM is configured with LTS as the default Node version
- Docker is installed via the official [get.docker.com](https://get.docker.com) script
- Your user is automatically added to the `docker` group
- AWS CLI v2 is installed using the architecture-specific installer from AWS
