import subprocess

def install(path):
    print(f"Installing...")
    subprocess.run(f"./scripts/{path}.sh")

scripts = {
    "Essentials": lambda: install("config/essentials"),
    "Git Config": lambda: install("git_config"),
    "Gaming": lambda: install("gaming"),
    "Brave Browser": lambda: install("programs/brave"),
    "Java 21": lambda: install("java"),
    "Rust": lambda: install("rust"),
    "Node": lambda: install("node"),
    "ssh_key": lambda: install("ssh_key"),
    "nvim": lambda: install("nvim"),
    "Discord": lambda: install("programs/discord"),
    "EasyEffects (EQ)": lambda: install("programs/easyeffects"),
    "Docker": lambda: install("programs/docker"),
    "Obsidian": lambda: install("programs/obsidian"),
    "1Password": lambda: install("programs/password"),
    "Postman": lambda: install("programs/postman"),
    "Spotify": lambda: install("programs/spotify"),
    "Toolbox": lambda: install("programs/toolbox"),
    "VsCode": lambda: install("programs/vscode"),
    "Gitlab CLI": lambda: install("gitlab"),
    "Font": lambda: install("config/font"),
    "Gnome Config": lambda: install("config/gnome"),
    "Trivy": lambda: install("trivy"),
    "Rclone": lambda: install("rclone"),
    "Kube Stack (Kubectl + Helm)": lambda: install("kube")
    "zsh": lambda: install("config/zsh"),
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
    print("Successfully installed everything! Consider checking out the manual setups and scripts")
