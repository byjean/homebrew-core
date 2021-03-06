class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://github.com/soimort/you-get/releases/download/v0.4.900/you-get-0.4.900.tar.gz"
  sha256 "4206d6503d6038af0870ee551cc4bae1c3332829b4eb373e226eb2b1a4fb616b"
  head "https://github.com/soimort/you-get.git", :branch => "develop"

  bottle do
    cellar :any_skip_relocation
    sha256 "f932714abb84918f54c41bf944c11aec8b87bf1e41292f646b722d0dcd57f6e9" => :sierra
    sha256 "550f18a36ee2082aba2a2133e99d03608680697d38636d909399118854780fe2" => :el_capitan
  end

  depends_on :python3

  depends_on "rtmpdump" => :optional

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
