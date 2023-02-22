# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Your CLI home video recorder"
HOMEPAGE="https://github.com/charmbracelet/vhs"
SRC_URI="https://github.com/charmbracelet/vhs/archive/v${PV}.tar.gz"
SRC_URI+=" https://github.com/atchim/esoup/releases/download/v9999/${CATEGORY}-${P}-vendor.tar.xz"

LICENSE="Apache-2.0 BSD-3-Clause MIT MPL-2.0"
IUSE="examples"
KEYWORDS="~amd64"
SLOT="0"

DEPEND="app-misc/ttyd media-video/ffmpeg"

RESTRICT="test"

src_compile() {
    ego build
}

src_install() {
	dobin vhs
	dodoc README.md

	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
