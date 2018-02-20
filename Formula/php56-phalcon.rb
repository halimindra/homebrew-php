require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Phalcon < AbstractPhp56Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.2.0.tar.gz"
  sha256 "559211b861a71ae6032216b2dc41d085560354072c95d1000b13fd37b0e0e008"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "32f83fc7ab4eeee37a6577e5920ed5d94f455c723cf9499d195fad3be30c104e" => :high_sierra
    sha256 "71576380cb9c7ad40577dbda4b38329019f54c0e63d3b3db2c0089e066667bb7" => :sierra
    sha256 "6aa1be9da4bbce712f12fcfddb68b9f7e3eba2f1349ed4d761427cc9d189b3c2" => :el_capitan
  end

  depends_on "pcre"

  def install
    Dir.chdir "build/php5/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
