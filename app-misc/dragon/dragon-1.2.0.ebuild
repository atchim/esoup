# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
EAPI=8

DESCRIPTION="Drag and drop source/target for X"
HOMEPAGE="https://github.com/mwh/dragon"
SRC_URI="https://github.com/mwh/dragon/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64"
SLOT="0"

DEPEND=">=x11-libs/gtk+-3"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e 's/\(`pkg-config --cflags .*`\) \(`pkg-config --libs .*`\)/\1 $(CFLAGS) \2 $(LDFLAGS)/' \
		-i Makefile || die "sed failed"
}

src_install() {
	dobin dragon
	doman dragon.1
	dodoc README
}