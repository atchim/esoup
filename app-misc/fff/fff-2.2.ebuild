EAPI=7

inherit optfeature

DESCRIPTION='A simple file manager written in bash'
HOMEPAGE=https://github.com/dylanaraps/fff
SRC_URI="https://github.com/dylanaraps/fff/archive/refs/tags/$PV.tar.gz"

KEYWORDS=~amd64
LICENSE=MIT
SLOT=0

RDEPEND='
  >=app-shells/bash-3.2
  sys-apps/coreutils
'

src_prepare() {
  sed -i -e "/^DOCDIR ?= .*/s/\$/-$PV/" "$S/Makefile" || die
  default
}

src_compile() { :; }

pkg_postinst() {
  optfeature 'image display support' 'sys-apps/fbset www-client/w3m[imlib] x11-misc/xdotool'
  optfeature 'XDG support' 'x11-misc/xdg-user-dirs x11-misc/xdg-utils'
}
