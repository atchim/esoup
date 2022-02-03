EAPI=7

DESCRIPTION='A pretty system information tool written in POSIX sh'
SRC_URI="https://github.com/dylanaraps/pfetch/archive/refs/tags/$PV.tar.gz"
HOMEPAGE='https://github.com/dylanaraps/pfetch'

KEYWORDS='~amd64'
LICENSE='MIT'
SLOT=0

src_compile() { :; }

src_install() {
	dobin pfetch
	dodoc README.md
}
