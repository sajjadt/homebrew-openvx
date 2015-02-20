class Openvx < Formula
  homepage "https://www.khronos.org/openvx/"
  url "https://www.khronos.org/registry/vx/sample/openvx_sample_20141217.tar.gz"
  sha1 "144403e3b3e7e7f6f3a75371bfd3ca023466bbfa"
  version "1.0" # Official version this snapshot implements

  depends_on "cmake" => :build

  patch do
    url "https://raw.githubusercontent.com/machineswithvision/homebrew-openvx/master/openvx_sample_macos.diff"
    sha1 "9b9e0b871925ad844a44d23bcf3ccc6fb6feb348"
  end

  # TODO: add flags for OpenCL support and SDL demo/libs

  def install
    args = std_cmake_args
    args << "-DAPPLE=1"
    args << "-DBUILD_X64=1"

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
