# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A pretty system information tool written in POSIX sh"
HOMEPAGE="https://github.com/dylanaraps/pfetch"
EGIT_REPO_URI="https://github.com/dylanaraps/pfetch.git"

LICENSE="MIT"
SLOT="0"

src_compile() {
    :
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}" install
	dodoc README.md
}
