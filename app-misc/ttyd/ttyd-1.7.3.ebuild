# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake systemd

MY_PV="$(ver_rs 3 '-')"

DESCRIPTION="Share your terminal over the web"
HOMEPAGE="https://github.com/tsl0922/ttyd"
SRC_URI="https://github.com/tsl0922/ttyd/archive/${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"

BDEPEND=">=dev-util/cmake-2.8"
DEPEND="
	dev-libs/json-c
	>=net-libs/libwebsockets-3.2.0:=[libuv]
	|| (
		>=net-libs/libwebsockets-3.2.0:=[mbedtls]
		dev-libs/openssl
	)
	sys-libs/zlib
"

S="${WORKDIR}/${PN}-${MY_PV}"

src_install() {
	cmake_src_install
	doman man/*.1
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"
}
