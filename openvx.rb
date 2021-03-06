class Openvx < Formula
  homepage "https://www.khronos.org/openvx/"
  url "https://www.khronos.org/registry/vx/sample/openvx_sample_1.1.tar.bz2"
  sha1 "48fd4854ccf0212b2c90c899f89f910401499c67"
  version "1.1" # Official version this snapshot implements

  depends_on "cmake" => :build

#  patch do
#    url "https://raw.githubusercontent.com/sajjadt/homebrew-openvx/master/openvx_sample_macos.diff"
#    sha1 "065bcc0099d5633c429b655c98159b56cc731d8e"
#  end

  patch do
    url "https://raw.githubusercontent.com/sajjadt/homebrew-openvx/master/openvx_sample_with_user_kernels.diff"
    sha1 "4b72d4717b5c9804f4372ef5453e31b45945b2bb"
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
