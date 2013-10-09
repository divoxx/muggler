require 'formula'

class Muggler < Formula
  homepage 'https://github.com/divoxx/muggler'
  url 'https://github.com/divoxx/muggler/archive/v0.1.1.tar.gz'
  sha1 'eb32e14b5c529c231a175ce753713b7e21e61ff4'

  def install
    system "cp -R * \"#{prefix}/\""
  end

  test do
    system "muggler"
  end
end
