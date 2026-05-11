class Dsv4CcProxy < Formula
  desc "DeepSeek Anthropic API compatibility proxy for Claude Code"
  homepage "https://github.com/HosheaLi/P14_dsv4ToCC"
  url "https://files.pythonhosted.org/packages/source/d/dsv4-cc-proxy/dsv4_cc_proxy-1.8.0.tar.gz"
  sha256 "651723cbffb0414b14facc1a411997b2d1de5d78a454b584493b8f0e466c942a"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  service do
    run opt_bin/"dsv4-cc-proxy"
    keep_alive true
    port 16889
  end
end
