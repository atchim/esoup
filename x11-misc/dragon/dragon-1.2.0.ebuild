EAPI=7

DESCRIPTION='Drag and drop source/target for X'
HOMEPAGE=https://github.com/mwh/dragon
SRC_URI="https://github.com/mwh/dragon/archive/refs/tags/v$PV.tar.gz"

KEYWORDS=~amd64
LICENSE=GPL-3
SLOT=0

RDEPEND='>=x11-libs/gtk+-3'

src_install() {
  emake install DESTDIR="$D" PREFIX="$EPREFIX/usr"
  dodoc README
  doman $PN.1
}
