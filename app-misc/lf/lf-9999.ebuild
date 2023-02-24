# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 git-r3 go-module desktop xdg-utils

DESCRIPTION="Terminal file manager"
HOMEPAGE="https://github.com/gokcehan/lf"
EGIT_REPO_URI="https://github.com/gokcehan/lf.git"

LICENSE="MIT"
IUSE="examples"
SLOT="0"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile () {
	gen/build.sh || die
}


src_install() {
	dobin "${PN}"
	doman "${PN}.1"

	dodoc README.md

	if use examples; then
		docinto examples
		for example in etc/*.example; do
			local new_example="${example#etc/}"
			new_example="${new_example%.example}"
			newdoc "${example}" "${new_example}"
		done
	fi

	docinto etc
	dodoc etc/{lf.{csh,ps1,vim},lfcd.{cmd,csh,ps1,sh}}

	newbashcomp  etc/lf.bash lf

	insinto /usr/share/zsh/site-functions
	newins etc/lf.zsh _lf

	insinto /usr/share/fish/vendor_completions.d
	doins etc/lf.fish
	insinto /usr/share/fish/vendor_functions.d
	doins etc/lfcd.fish

	domenu lf.desktop
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
