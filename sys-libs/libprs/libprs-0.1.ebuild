# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="PRS library - Simple file and logger library version 0.1"
HOMEPAGE="https://github.com/psimonson/libprs"

LICENSE="public-domain"
SLOT="0"
KEYWORDS=""
IUSE="32 64"

DEPEND=""
RDEPEND="${DEPEND}"

GITHUB_REPO="libprs"
GITHUB_USER="psimonson"
GITHUB_TAG="b9b1dfd0c2841845de8f695d39f53048ed40c64e"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_TAG} -> ${PN}-${GITHUB_TAG}.tar.gz"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_USER}-${GITHUB_REPO}"-??????? "${S}" || die
}

src_compile() {
	make all
}

src_install() {
	addwrite "${EPREFIX}/usr/local/lib64"
	addwrite "${EPREFIX}/usr/local/include"
	make install
	ldconfig
}

