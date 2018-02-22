require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Phalcon < AbstractPhp56Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.13.tar.gz"
  sha256 "0a1bd6afe902c6f2f68cf5e2f2785503f5ad95d1d2cf1b66c77154c483a08a35"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "0a1bd6afe902c6f2f68cf5e2f2785503f5ad95d1d2cf1b66c77154c483a08a35" => :high_sierra
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
