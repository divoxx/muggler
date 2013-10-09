require 'formula'

class Muggler < Formula
  homepage 'https://github.com/divoxx/muggler'
  url 'https://github.com/divoxx/muggler/archive/v0.1.0.tar.gz'
  sha1 '9628d458a70ce9b5fa0a801f78f4455491e4a305'

  def install
    system "cp -R * \"#{prefix}/\""
  end

  test do
    system "muggler"
  end
end
