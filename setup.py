import subprocess
import os
from enum import Enum

class Distro(Enum):
    UNSUPPORTED = 1
    ARCH = 2
    DEBIAN = 3

# === HELPER ===
def determine_distro():
    if os.path.isfile('/etc/arch-release'):
        return Distro.ARCH
    elif os.path.isfile('/etc/lsb-release'):
        return Distro.DEBIAN
    else:
        return Distro.UNSUPPORTED

def install(program, path):
    print(f"Running {program} installation...")
    subprocess.run(f"./scripts/{path}")


def install_distro_dependent(program, path):
    distro = determine_distro()
    match distro:
        case Distro.ARCH:
            install(program, f"arch/{path}")
        case Distro.DEBIAN:
            install(program, f"ubuntu/{path}")
        case Distro.UNSUPPORTED:
            print("Unsupported OS. Skipping...")

# START ---- Define scripts -----
def install_essentials():
    install_distro_dependent("Essentials", "essentials.sh")
    install("Git Config", "commons/git_config.sh")

def install_java():
    install_distro_dependent("Java", "java.sh")

def install_rust():
    install("Rust", "commons/rust.sh")

def install_node():
    install("Node.js", "commons/node.sh")

def install_ssh_key():
    install("SSH Key", "commons/ssh_key.sh")

def install_nvim():
    install_distro_dependent("Neovim", "nvim_dependencies.sh")
    subprocess.run("./scripts/commons/nvim.sh")

def install_discord():
    install_distro_dependent("Discord", "programs/discord.sh")

def install_docker():
    install_distro_dependent("Docker", "programs/docker.sh")

def install_flameshot():
    install_distro_dependent("Flameshot", "programs/flameshot.sh")

def install_obsidian():
    install_distro_dependent("Obsidian", "programs/obsidian.sh")

def install_password():
    install_distro_dependent("1Password", "programs/password.sh")

def install_postman():
    install_distro_dependent("Postman", "programs/postman.sh")

def install_spotify():
    install_distro_dependent("Spotify", "programs/spotify.sh")

def install_toolbox():
    install("Toolbox", "commons/toolbox.sh")

def install_vscode():
    install_distro_dependent("VSCode", "programs/vscode.sh")

def install_aliases():
    install("Aliases", "commons/aliases.sh")

def install_gitlab():
    install_distro_dependent("GitLab CLI", "gitlab.sh")

def install_font():
    install("Fonts", "commons/font.sh")

def install_eurokey():
    de = os.environ["DESKTOP_SESSION"]
    match de:
        case "plasma":
            install("KDE EurKey", "commons/kde_eurkey.sh")
        case "gnome":
            install("Gnome EurKey", "commons/gnome_eurkey.sh")
        case _:
            print("Unsupported OS. Skipping...")

def install_zsh():
    install_distro_dependent("ZSH", "zsh.sh")
    subprocess.run("./scripts/commons/zsh_configuration.sh")

# END ---- Define scripts -----

scripts = {
    "essentials": install_essentials,
    "java": install_java,
    "rust": install_rust,
    "node": install_node,
    "ssh_key": install_ssh_key,
    "nvim": install_nvim,
    "discord": install_discord,
    "docker": install_docker,
    "flameshot": install_flameshot,
    "obsidian": install_obsidian,
    "1password": install_password,
    "postman": install_postman,
    "spotify": install_spotify,
    "toolbox": install_toolbox,
    "vscode": install_vscode,
    "aliases": install_aliases,
    "gitlab": install_gitlab,
    "font": install_font,
    "eurokey": install_eurokey,
    "zsh": install_zsh,
}

def install_scripts():
    for script_name in scripts:
        if asks_for(script_name):
            scripts[script_name]()  # Run the script function
            print(f"Successfully installed {script_name}")

def asks_for(script_name):
    answer = input(f"Install {script_name}? [Y/N]: ").strip().lower()
    return answer == 'y'

if __name__ == "__main__":
    install_scripts()
    print("Successfully installed everything!")
