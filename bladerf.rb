require 'formula'

class Bladerf < Formula
  homepage 'http://nuand.com/'
  head 'https://github.com/Nuand/bladeRF.git'

  depends_on 'cmake' => :build
  depends_on 'libusb'
  depends_on 'pkgconfig'
  depends_on 'libtecla'

  def install
    cd 'host'
    mkdir 'build' do
      args = %W[
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=#{prefix}
        -DCMAKE_C_COMPILER=#{ENV.cc}
        -DINSTALL_UDEV_RULES=OFF
      ]
      system "cmake", "..", *args, *std_cmake_args
      system "make"
      system "make install"
    end
  end
end
