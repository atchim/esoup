# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="Your CLI home video recorder"
HOMEPAGE="https://github.com/charmbracelet/vhs"
EGIT_REPO_URI="https://github.com/charmbracelet/vhs.git"

LICENSE="Apache-2.0 BSD MIT MPL-2.0"
IUSE="examples"
SLOT="0"

RDEPEND="
	>=app-misc/ttyd-1.7.2
	app-shells/bash
	media-video/ffmpeg
"

RESTRICT="test"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
    ego build
}

src_install() {
	dobin vhs
	dodoc README.md

	if use examples; then
		dodoc -r examples
		docompress -x "/usr/share/doc/${PF}/examples"
	fi
}
