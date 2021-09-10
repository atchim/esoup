EAPI=7

inherit git-r3 optfeature

DESCRIPTION='A simple file manager written in bash'
EGIT_REPO_URI=https://github.com/dylanaraps/fff
HOMEPAGE=https://github.com/dylanaraps/fff

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

src_compile() { return 0; }

pkg_postinst() {
  optfeature 'image display support' 'sys-apps/fbset www-client/w3m[imlib] x11-misc/xdotool'
  optfeature 'XDG support' 'x11-misc/xdg-user-dirs x11-misc/xdg-utils'
}
