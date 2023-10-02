### Reason behind the 'Externally Managed Environment' Error
The change has been done to avoid the "conflict between OS package managers and Python-specific package management tools like pip. These conflicts include both Python-level API incompatibilities and conflicts over file ownership."

How to solve this problem => you have two option to solve this problem
1. The `--break-system-packages` flag in `pip` allows to override the `externally-managed-environment` error and install Python packages system-wide.
```sh
pip install package_name --break-system-packages
```
2. Use Pipx tool (recommended)
What you saw above involves manual work. Pipx automates it.

It automatically creates a new virtual environment for each app you install. Not only that. It also creates a link to it in .local/bin. This way, the user who installed the package can run it from anywhere in the command line.

I guess that's what most desktop Linux users want here.

Install pipx on Ubuntu using this command:
```sh
sudo apt install pipx
```
It will probably install a huge number of dependencies
Now add it to the PATH so that you can run from anywhere:
```sh
pipx ensurepath
```
Great! Now you can install Python packages using Pipx instead of Pip:
```sh
pipx install package_name
```
you can find Commands Guide of pipx in this link:
[install pipx on Ubuntu](https://itsfoss.com/install-pipx-ubuntu/)
