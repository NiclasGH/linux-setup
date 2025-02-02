import subprocess
import os
import warnings
from enum import Enum

class Distro(Enum):
    UNSUPPORTED = 1
    ARCH = 2
    DEBIAN = 3
    FEDORA = 4

# === HELPER ===
def determine_distro():
    if not os.path.isfile('/etc/os-release'):
        return Distro.UNSUPPORTED
        
    try:
        with open('/etc/os-release', 'r') as f:
            os_release = f.read().lower()
            
        if 'arch' in os_release:
            return Distro.ARCH
        elif 'debian' in os_release or 'ubuntu' in os_release:
            return Distro.DEBIAN
        elif 'fedora' in os_release:
            return Distro.FEDORA
        else:
            warnings.warn("You're using an unsupported OS. Most installations will not work")
            return Distro.UNSUPPORTED
    except OSError:
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
            install(program, f"debian/{path}")
        case Distro.FEDORA:
            install(program, f"fedora/{path}")
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
    install_distro_dependent("Nvim Installation", "nvim_dependencies.sh")
    install("Nvim Configuration", "commons/nvim.sh")

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
    install_distro_dependent("ZSH Installation", "zsh.sh")
    install("ZSH Configuration", "commons/zsh_configuration.sh")

def install_trivy():
    install("Trivy", "commons/trivy.sh")

def install_rclone():
    install_distro_dependent("Rclone", "rclone.sh")

def install_kube():
    install("Kubectl", "commons/kubectl.sh")
    install_distro_dependent("Helm", "helm.sh")

# END ---- Define scripts -----

scripts = {
    "Essentials": install_essentials,
    "Java 21": install_java,
    "Rust": install_rust,
    "Node": install_node,
    "ssh_key": install_ssh_key,
    "nvim": install_nvim,
    "Discord": install_discord,
    "Docker": install_docker,
    "Flameshot": install_flameshot,
    "Obsidian": install_obsidian,
    "1Password": install_password,
    "Postman": install_postman,
    "Spotify": install_spotify,
    "Toolbox": install_toolbox,
    "VsCode": install_vscode,
    "Gitlab CLI": install_gitlab,
    "Font": install_font,
    "Eurokey": install_eurokey,
    "zsh": install_zsh,
    "Trivy": install_trivy,
    "Rclone": install_rclone,
    "Kube Stack (Kubectl + Helm)": install_kube
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
