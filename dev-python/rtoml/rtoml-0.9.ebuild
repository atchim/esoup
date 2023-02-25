# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash-0.8.1
	autocfg-1.1.0
	bitflags-1.3.2
	bumpalo-3.11.1
	cc-1.0.73
	cfg-if-1.0.0
	getrandom-0.2.8
	hashbrown-0.11.2
	indexmap-1.8.1
	indoc-1.0.6
	js-sys-0.3.60
	libc-0.2.125
	libmimalloc-sys-0.1.25
	lock_api-0.4.7
	log-0.4.17
	memoffset-0.6.5
	mimalloc-0.1.29
	nohash-hasher-0.2.0
	once_cell-1.16.0
	parking_lot-0.12.0
	parking_lot_core-0.9.3
	proc-macro2-1.0.38
	pyo3-0.17.3
	pyo3-build-config-0.17.3
	pyo3-ffi-0.17.3
	pyo3-macros-0.17.3
	pyo3-macros-backend-0.17.3
	quote-1.0.18
	redox_syscall-0.2.13
	scopeguard-1.1.0
	serde-1.0.137
	smallvec-1.8.0
	syn-1.0.92
	target-lexicon-0.12.3
	toml-0.5.9
	unicode-xid-0.2.3
	unindent-0.1.9
	version_check-0.9.4
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
"

DISTUTILS_USE_PEP517="maturin"
PYTHON_COMPAT=( python3_{7..11} )

inherit cargo distutils-r1

DESCRIPTION="A fast TOML library for Python implemented in Rust"
HOMEPAGE="https://pypi.org/project/rtoml https://github.com/samuelcolvin/rtoml"
SRC_URI="https://github.com/samuelcolvin/rtoml/archive/v${PV}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
