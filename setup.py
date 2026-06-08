import subprocess

def install(name):
    print(f"Installing...")
    subprocess.run(f"./scripts/{name}.sh")

scripts = [
    ("Trivy", "trivy"),
    ("EasyEffects (EQ)", "easyeffects"),
    ("Rclone", "rclone"),
]

def install_scripts():
    print("Available scripts:")
    for i, (name, _) in enumerate(scripts, 1):
        print(f"  {i}: {name}")

    print()
    raw = input("Enter numbers to install (comma separated): ").strip()

    selected = []
    for part in raw.split(","):
        part = part.strip()
        if part.isdigit():
            idx = int(part) - 1
            if 0 <= idx < len(scripts):
                selected.append(scripts[idx])
            else:
                print(f"  Skipping {part}: out of range")
        elif part:
            print(f"  Skipping '{part}': not a valid number")

    if not selected:
        print("Nothing selected.")
        return

    print()
    for name, script in selected:
        install(script)
        print(f"Successfully installed {name}\n")

if __name__ == "__main__":
    install_scripts()
    print("Done! Consider checking out the manual setups and scripts.")
