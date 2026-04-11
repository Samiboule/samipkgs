# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop

DESCRIPTION="A Technical Kart Racer based on Sonic Robo Blast 2"

HOMEPAGE="https://www.kartkrew.org/"

COMMIT="e3daa1bbef09497fbd62668315d2eff4c20384c1"

S="${WORKDIR}/RingRacers-${COMMIT}"

SRC_URI="https://github.com/KartKrewDev/RingRacers/archive/${COMMIT}.tar.gz"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="=games-arcade/ringracers-assets-${PV} net-misc/curl sys-libs/zlib media-libs/libpng media-libs/libogg media-libs/libvorbis media-libs/libvpx media-libs/libyuv media-libs/libsdl2 media-libs/opus"

DEPEND="${RDEPEND}"

BDEPEND="dev-build/cmake dev-build/ninja sys-devel/gcc"

src_configure() {
	local mycmakeargs=(
		-Wno-dev
		-G Ninja
		-DCMAKE_BUILD_TYPE='Release'
		-DCMAKE_C_FLAGS="-g1 -O3"
		-DCMAKE_CXX_FLAGS=-"g1 -O3 -fpermissive"
		-DSRB2_CONFIG_DEV_BUILD=OFF
		-DCMAKE_INSTALL_PREFIX=/usr/bin
		-DSRB2_SDL2_EXE_NAME="ringracers"
		-DACSVM_INSTALL_LIB=OFF
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install

	domenu ${FILESDIR}/org.kartkrew.RingRacers.desktop
	newicon ${S}/srb2.png org.kartkrew.RingRacers.png
}
