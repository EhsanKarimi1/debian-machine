# install from source
1. Install build prerequisites on your system
Build prerequisites : 
- **Clang** or **GCC** version 4.9+
- **CMake** version 3.10+

## Debian

```sh
sudo apt install cmake unzip curl gettext ninja-build -y
```
## RedHat Based OS

```sh
sudo dnf -y install cmake gcc unzip curl gettext make ninja-build
```
2. `git clone https://github.com/neovim/neovim`
3. chage directory to neovim and do this commands

```sh
make CMAKE_BUILD_TYPE=Release
sudo make install
```
For Unix-like systems this installs Neovim to /usr/local.

4. On Debian/Ubuntu, instead of installing files directly with `sudo make install`, you can run `cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb` to build DEB-package and install it. This should help ensuring the clean removal of installed files.

# Uninstall

There is a CMake target to uninstall after make install:

```sh
sudo cmake --build build/ --target uninstall
```

Alternatively, just delete the CMAKE_INSTALL_PREFIX artifacts:

```sh
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
```
