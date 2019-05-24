# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-multilib

DESCRIPTION="PRS library - Simple file and logger library version 0.1"
HOMEPAGE="https://github.com/psimonson/libprs"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

GITHUB_REPO="libprs"
GITHUB_USER="psimonson"
GITHUB_TAG="43a5cf8448d71863b663fb59f21fc1ea85dd2e83"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_TAG} -> ${PN}-${GITHUB_TAG}.tar.gz"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_USER}-${GITHUB_REPO}"-??????? "${S}" || die
}

autotools-multilib_src_configure() {
	autoreconf -vfi
	./configure --prefix=/usr
}

autotools-multilib_src_compile() {
	make
}

autotools-multilib_src_install() {
	make DESTDIR="${D}" install
	rm -f "${D}"/usr/lib*/*.so
}

