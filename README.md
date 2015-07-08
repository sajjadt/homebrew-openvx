# Sample OpenVX for MacOS

* *8th July 2015 - updated for OpenVX 1.0.1.*
* *20th Feb 2015 - initial version for OpenVX 1.0*

This is a [homebrew](http://brew.sh) tap for a modified version of [OpenVX 1.0](https://www.khronos.org/openvx/) which has been updated to build on MacOS. 

All the changes to the OpenVX tar-ball/archive necessary to perform the build are applied via the [accompanying patch file](https://raw.githubusercontent.com/machineswithvision/homebrew-openvx/master/openvx_sample_macos.diff). 

Until such time as these changes are accepted by any official OpenVX maintainers you can instead simply install on Mac via [Homebrew](http://brew.sh) with the following two commands:

		> brew tap machineswithvision/openvx
		> brew install openvx

Please note, there is some (untested) hardware acceleration with OpenCL which can be enabled by:

		> brew install openvx --with-opencl 

If you want to remove this install, do it with:

		> brew remove openvx

And if you want to remove the tap, do:

		> brew untap machineswithvision/openvx  

Enjoy!

*The MwV Team*


