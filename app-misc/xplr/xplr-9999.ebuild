EAPI=7

LUA_COMPAT=(luajit)

inherit cargo desktop git-r3 lua-single

DESCRIPTION='A hackable, minimal, fast TUI file explorer'
EGIT_REPO_URI=https://github.com/sayanarijit/xplr
HOMEPAGE='https://arijitbasu.in/xplr/en/ https://github.com/sayanarijit/xplr'

IUSE=X
KEYWORDS=~amd64
LICENSE=MIT
SLOT=0

DEPEND="$RDEPEND"
RDEPEND="$LUA_DEPS"
REQUIRED_USE="$LUA_REQUIRED_USE"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_prepare() {
	sed -i Cargo.toml -e 's/"vendored"\s*,//' || die
	default
}

src_install() {
	dobin "target/release/$PN"
	use X || return 0
	local icon='' size=''
	for icon in ./assets/icon/*.png; do
		size="${icon##*/$PN}"
		newicon -s "${size%%.*}" "$icon" "$PN.png"
	done
	doicon -s scalable "assets/icon/$PN.svg"
	domenu assets/desktop/*
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
