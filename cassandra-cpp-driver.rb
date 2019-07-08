class CassandraCppDriver < Formula
  homepage "http://datastax.github.io/cpp-driver/"
  url "https://github.com/datastax/cpp-driver/archive/2.12.0.tar.gz"
  sha256 "67c51ebccaa85d9b686ffa007d042b8aa93a3ca802bc1d329e510d56899557b6"

  head "https://github.com/datastax/cpp-driver.git", :branch => "master"

  depends_on "cmake" => :build
  depends_on "libuv"
  depends_on "openssl"

  def install
    mkdir "build" do
      args = std_cmake_args - %w{-DCMAKE_BUILD_TYPE=None}
      args << "-DCMAKE_INSTALL_LIBDIR=#{lib}"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << "-DCASS_BUILD_STATIC=ON"
      system "cmake", "..", *args 
      system "make", "install"
    end
  end
end
