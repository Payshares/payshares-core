This approach uses [update-alternatives](https://linux.die.net/man/8/update-alternatives) to manage GCC and LLVM/CLANG C/C++ compiler toolchains.
Although tested on Linux Mint 18.3, this approach should work on any Debian based distro or for that matter any Linux distro with `update-alternatives` support, provided the packages are installed correctly.

There are 3 files

* `gcc-alternatives.sh` installs GCC versions 5/6/7 and sets up alternatives for `gcc`/`g++`/`cpp`/`gfortran`.
* `llvm-clang-alternatives.sh` installs LLVM and CLANG versions 4/5 and sets up alternatives for various LLVM and CLANG programs including `clang` and `clang++`.
* `cc-alternatives.sh` sets up alternatives for the `cc`, `cxx`, and the `ld` commands. This script can be used to change systemwide default compiler/linker combination to either GCC or CLANG.

Once these scripts are run you can change the system GCC/CLANG versions by running `sudo update-alternatives --config gcc|clang`. To change the default compiler/linker combo used by the system do `sudo update-alternatives --config cc`.

**NOTE:** Both the `gcc` and the `clang` compilers use the `libstdc++`, the [C++ standards library](https://gcc.gnu.org/onlinedocs/libstdc++/) which is the default on Linux. There are ways to build `libc++`, which is an LLVM provided [alternative](https://libcxx.llvm.org/) to `libstdc++` and use that instead, but there are hardly any advantages to doing that, so I haven't included notes for that here.
