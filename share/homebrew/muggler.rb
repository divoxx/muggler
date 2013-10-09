require 'formula'

class Muggler < Formula
  homepage 'https://github.com/divoxx/muggler'
  url 'https://github.com/divoxx/muggler/archive/v0.1.0.tar.gz'
  sha1 '0c55a02bfd88e9559917bcbd7c0998b909e3a5f3'

  def install
    system "cp -R * \"#{prefix}/\""
  end

  test do
    system "muggler"
  end
end
