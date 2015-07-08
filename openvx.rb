class Openvx < Formula
  homepage "https://www.khronos.org/openvx/"
  url "https://www.khronos.org/registry/vx/sample/openvx_sample_1.0.1.tar.bz2"
  sha1 "bfbc6c3b37ff9bc671cb824e572bf9f73a9ddc3f"
  version "1.0.1" # Official version this snapshot implements

  depends_on "cmake" => :build

  patch do
    url "https://raw.githubusercontent.com/machineswithvision/homebrew-openvx/master/openvx_sample_macos.diff"
    sha1 "eee23142e3b42dfb90cf3a9873527a0a050512bc"
  end

  # TODO: add more flags/support and SDL demo/libs etc?

  option "with-opencl", "Attempt to build with MacOS OpenCL support."	

  def install
    args = std_cmake_args
    args << "-DAPPLE=1"
    args << "-DBUILD_X64=1"

		if build.with? "opencl"
			args << "-DEXPERIMENTAL_USE_OPENCL=1"
		end

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    # TODO: ideally this should be vx_test - which runs but needs the test
    # images to also be installed, and locatable, for it...
    system "vx_example"
  end

end
