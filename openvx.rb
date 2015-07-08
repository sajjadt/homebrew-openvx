class Openvx < Formula
  homepage "https://www.khronos.org/openvx/"
  url "https://www.khronos.org/registry/vx/sample/openvx_sample_1.0.1.tar.bz2"
  sha1 "144403e3b3e7e7f6f3a75371bfd3ca023466bbfa"
  version "1.0.1" # Official version this snapshot implements

  depends_on "cmake" => :build

  patch do
    url "https://raw.githubusercontent.com/machineswithvision/homebrew-openvx/master/openvx_sample_macos.diff"
    sha1 "7fd5ba520ce6bf006a762daabf4b803a9ec3827b"
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
