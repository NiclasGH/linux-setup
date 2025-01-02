# Linux Setup
This is a repository for a quick setup of linux and managing of common configurations between different machines like aliases. There are 4 scripts in the root directory:

* init-linux.sh: This script is meant to be run only once. It is usually copied from github and then run locally. It sets up ssh with github, does the most basic required git config, pulls the repository and sets up all the aliases
* pull.sh: By default also runnable with 'pull-aliases', will delete the local alias configurations and replaces them with the remote ones. Device aliases are excluded by this.
* push.sh: By default also runnable with 'push-aliases', will delete the remote alias configurations and replaces them with the local ones. Device aliases are excluded by this.
* script.py: This is a larger aggregation of scripts. With this python you can customize what you need installed. This includes programming languages but also normal applications.

## Requirements
You need python to be able to run the setup.py script. If you are running a debian based distro, you're also expected to have snap installed. To install snap there is a scipt under manual_scripts/ 
