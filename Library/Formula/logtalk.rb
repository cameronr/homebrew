require "formula"

class Logtalk < Formula
  homepage "http://logtalk.org"
  url "http://logtalk.org/files/lgt2441.tar.bz2"
  sha256 "ca49d8e26a08dcf2a39358efa827789ecc5c47791035e5bb5830a6aec59b94e9"
  version "2.44.1"

  devel do
    url "http://logtalk.org/files/logtalk-3.00.0-rc4.tar.bz2"
    sha256 "d40a52b79b4c82051287f4142d73b2a625652b8e712d1a2607ab7a89bca86e38"
    version "3.00.0-rc4"
  end

  head "https://github.com/LogtalkDotOrg/logtalk3.git"

  option "swi-prolog", "Build using SWI Prolog as backend"
  option "gnu-prolog", "Build using GNU Prolog as backend (Default)"

  if build.include?("swi-prolog")
    depends_on "swi-prolog"
  else
    depends_on "gnu-prolog"
  end

  def install
    if build.stable?
      cd("scripts") { system "./install.sh", prefix }
    else
      cd("scripts") { system "./install.sh", "-p", prefix }
    end
  end
end
