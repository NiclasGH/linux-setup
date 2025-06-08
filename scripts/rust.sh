#!/usr/bin/env bash

# Will reinstall rust which shouldnt cause any issues however

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
cargo install cargo-watch cargo-binstall
