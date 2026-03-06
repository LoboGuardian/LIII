# LIII
multi-platform bittorrent client

## Linux (Fedora) build

### Dependencies

```bash
sudo dnf install cmake gcc-c++ \
    qt5-qtbase-devel qt5-linguist qt5-qtwayland \
    boost-devel openssl-devel zlib-devel
```

### Build

```bash
make
```

Or manually:

```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DDEVELOPER_TRAFFIC_CONTROL=OFF
make -j$(nproc)
```

> `DEVELOPER_TRAFFIC_CONTROL=OFF` is required on Linux because the traffic control module depends on Qt private headers not available in the Fedora packages.

### Run

```bash
./build/src/liii.sh
```

A `liii.sh` launcher script is generated automatically next to the binary. It sets `QT_PLUGIN_PATH` so Qt can find the platform plugins installed on the system.

---

## Windows development/build environment:
* CMake
* Microsoft Visual Studio Community 2017 / Microsoft Visual C++ 2017
* Qt 5.12.10:
	- http://www.nic.funet.fi/pub/mirrors/download.qt-project.org/archive/qt/5.12/5.12.10/qt-opensource-windows-x86-5.12.10.exe - msvc2017 and msvc2017_64
	- http://www.nic.funet.fi/pub/mirrors/download.qt-project.org/online/qtsdkrepository/windows_x86/desktop/qt5_51210/qt.qt5.51210.debug_info.win64_msvc2017_64/5.12.10-0-202011040843qtbase-Windows-Windows_10-MSVC2017-Windows-Windows_10-X86_64-debug-symbols.7z - x64 Qt Core debug  symbols can be found here.
* Boost:
	- https://deac-fra.dl.sourceforge.net/project/boost/boost-binaries/1.76.0/boost_1_76_0-msvc-14.1-64.exe
	- https://deac-ams.dl.sourceforge.net/project/boost/boost-binaries/1.76.0/boost_1_76_0-msvc-14.1-32.exe
	
Pre-compiled 64-bit (x64) and 32-bit (x86) OpenSSL 1.1.1 libraries for Microsoft Windows Operating Systems with **a dependency on the Microsoft Visual Studio 2015-2019 runtime** from https://kb.firedaemon.com/support/solutions/articles/4000121705 included.<br/>BOOST_ROOT environment variable set accordingly.<br/>Please note that the repository provides its own build of libtorrent, some info <a href="https://github.com/aliakseis/LIII/issues/9#issuecomment-791950065">here.</a>

Both Qt Creator and Visual Studio can be used.

Please note that LIII **continues running** when the window is closed. It is closed by either invoking Menu > File > Exit or Exit from the systray LIII icon menu.

### Portable mode
**portable flag** - specific file or folder in the program folder (named `portable` without extension) triggers portable mode, when **LIII BitTorrent Client** starts it checks the program folder for such file or folder and if it is there data and settings are saved in the program folder. See also https://github.com/aliakseis/LIII/issues/1
