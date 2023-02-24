# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Start an xorg server"
HOMEPAGE="https://github.com/Earnestly/sx"
EGIT_REPO_URI="https://github.com/Earnestly/sx.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	x11-apps/xauth
	x11-base/xorg-server
"

src_compile() {
	:
}

src_install() {
	# NOTE: Makefile install is not used since it messes up with FHS/Gentoo
	# policy paths.
	dobin sx
	doman sx.1
	dodoc README
}
