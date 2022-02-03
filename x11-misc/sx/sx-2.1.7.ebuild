EAPI=7

DESCRIPTION='Start an xorg server'
HOMEPAGE=https://github.com/Earnestly/sx
SRC_URI="https://github.com/Earnestly/sx/archive/refs/tags/$PV.tar.gz"

KEYWORDS=~amd64
LICENSE=MIT
SLOT=0

RDEPEND='
  x11-apps/xauth
  x11-base/xorg-server
'

src_compile() { :; }

src_install() {
  emake install DESTDIR="$D" PREFIX="$EPREFIX/usr"
  dodoc README
}
