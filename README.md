# Sample OpenVX for MacOS

This is a [homebrew](http://brew.sh) tap for a modified version of [OpenVX 1.0](https://www.khronos.org/openvx/) which has been updated to build on MacOS. 

All the changes to OpenVX to perform the build are applied via the [accompanying patch file](https://raw.githubusercontent.com/machineswithvision/homebrew-openvx/master/openvx_sample_macos.diff). 

Until such time as these changes are accepted by any official OpenVX maintainers you can instead simply install on Mac via [Homebrew](http://brew.sh) with the following two commands:

		> brew tap machineswithvision/openvx
		> brew install openvx

Please note, there is currently no hardware acceleration enabled for MacOS!

Enjoy!

*The MwV Team*


