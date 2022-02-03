EAPI=7

DESCRIPTION='The deprecated C API for Spotify'
HOMEPAGE=https://mopidy.github.io/libspotify-archive
SRC_URI=https://mopidy.github.io/libspotify-archive/libspotify-12.1.51-Linux-x86_64-release.tar.gz

KEYWORDS=~amd64
LICENSE=Spotify
SLOT=0

QA_MULTILIB_PATHS=(
  /usr/lib/libspotify.so
  /usr/lib/libspotify.so.12
  /usr/lib/libspotify.so.12.1.51
)

S="$WORKDIR/$P-Linux-x86_64-release"

src_compile() { :; }

src_install() {
  emake prefix="$D/$EPREFIX/usr" install
  dodoc ChangeLog README
}
