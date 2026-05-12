class CcSwitchConfig < Formula
  desc "Lightweight Claude Code project-level API config switcher"
  homepage "https://github.com/HosheaLi/cc-switch-config"
  url "https://github.com/HosheaLi/cc-switch-config/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c2e4c24ae4fe87414fc38b746ee8a5e1ab4b53e20ef2feae7520892f33ad93c5"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--production"
    end
    (bin/"cc-config").write <<~EOS
      #!/bin/bash
      exec node "#{libexec}/dist/index.js" "$@"
    EOS
    chmod 0755, bin/"cc-config"
  end

  test do
    assert_match "cc-switch-config", shell_output("#{bin}/cc-config --version")
  end
end
