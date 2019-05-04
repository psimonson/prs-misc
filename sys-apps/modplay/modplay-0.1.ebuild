# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MODPlay - Simple MOD file player version 0.1"
HOMEPAGE="https://github.com/psimonson/modplay"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="media-libs/libsdl media-libs/sdl-mixer media-libs/sdl-ttf"
RDEPEND="${DEPEND}"

GITHUB_REPO="modplay"
GITHUB_USER="psimonson"
GITHUB_TAG="0246b92204bfbf1b8842927e7a2eac24a1b7ca81"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_TAG} -> ${PN}-${GITHUB_TAG}.tar.gz"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_USER}-${GITHUB_REPO}"-??????? "${S}" || die
}

src_compile() {
	make all
}

src_install() {
	addwrite "${EPREFIX}/usr/local/bin"
	addwrite "${EPREFIX}/usr/local/share"
	make install
}

