#!/bin/bash

# Will reinstall rust which shouldnt cause any issues however

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
exec cargo install cargo-watch cargo-binstall
