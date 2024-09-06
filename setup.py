import subprocess
import os
from enum import Enum

class Distro(Enum):
    UNSUPPORTED = 1
    ARCH = 2
    DEBIAN = 3

def determine_distro():
    if os.path.isfile('/etc/arch-release'):
        return Distro.ARCH
    elif os.path.isfile('/etc/lsb-release'):
        return Distro.DEBIAN
    else:
        return Distro.UNSUPPORTED

# START ---- Define scripts -----
def run_essentials():
    print("Running essentials scripts...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/essentials.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/essentials.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")
            return
    subprocess.run("./scripts/commons/git_config.sh")

def run_java():
    print("Running Java installation...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/java.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/java.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")

def run_rust():
    print("Running Rust installation...")
    subprocess.run("./scripts/commons/rust.sh")

def run_node():
    print("Running Node.js installation...")
    subprocess.run("./scripts/commons/node.sh")

def run_ssh_key():
    print("Running SSH key generation...")
    subprocess.run("./scripts/commons/ssh_key.sh")

def run_nvim():
    print("Running Neovim installation...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/nvim_dependencies.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/nvim_dependencies.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")
            return
    subprocess.run("./scripts/commons/nvim.sh")

def run_programs():
    print("Running programs installation...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/programs.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/programs.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")

def run_aliases():
    print("Setting up aliases...")
    subprocess.run("./scripts/commons/aliases.sh")

def run_gitlab():
    print("Setting up GitLab...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/gitlab.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/gitlab.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")

def run_font():
    print("Installing fonts...")
    subprocess.run("./scripts/commons/font.sh")

def run_kde_eurokey():
    print("Setting up KDE euro key...")
    subprocess.run("./scripts/commons/kde_eurokey.sh")

def run_zsh():
    print("Setting up zsh...")
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            subprocess.run("./scripts/arch/zsh.sh")
        case Distro.DEBIAN:
            subprocess.run("./scripts/ubuntu/zsh.sh")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")
            return
    subprocess.run("./scripts/commons/zsh_configuration.sh")
# END ---- Define scripts -----

scripts = {
    "essentials": run_essentials,
    "java": run_java,
    "rust": run_rust,
    "node": run_node,
    "ssh_key": run_ssh_key,
    "nvim": run_nvim,
    "programs": run_programs,
    "aliases": run_aliases,
    "gitlab": run_gitlab,
    "font": run_font,
    "kde_eurokey": run_kde_eurokey,
    "zsh": run_zsh,
}

def run_scripts():
    for script_name in scripts:
        if ask_for(script_name):
            scripts[script_name]()  # Run the script function

def ask_for(script_name):
    answer = input(f"Install {script_name}? [Y/N]: ").strip().lower()
    return answer == 'y'

if __name__ == "__main__":
    run_scripts()
