EAPI=7

inherit cargo git-r3

DESCRIPTION='The minimal, blazing-fast, and infinitely customizable prompt for any shell'
EGIT_REPO_URI=https://github.com/starship/starship.git
HOMEPAGE=https://starship.rs

IUSE='+battery'
KEYWORDS=~amd64
LICENSE='Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 BSD BSD-2 CC0-1.0 ISC MIT MPL-2.0 Unlicense ZLIB'
SLOT=0

src_unpack() {
  git-r3_src_unpack
  cargo_live_src_unpack
}

src_configure() {
  local myfeatures=(
    $(usex battery battery '')
  )
  cargo_src_configure --no-default-features
}

src_install() {
  dobin target/release/${PN}
  default
}

pkg_postinst() {
  elog 'Is advised to have a Nerd Font installed and enabled in your terminal.'
  elog 'Nerd Fonts are disponible to download via https://www.nerdfonts.com.'
}
