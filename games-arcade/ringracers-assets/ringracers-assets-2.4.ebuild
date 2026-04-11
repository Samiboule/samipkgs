# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The assets for Dr. Robotnik's Ring Racers"

HOMEPAGE="https://www.kartkrew.org/"

S="${WORKDIR}"

SRC_URI="https://github.com/KartKrewDev/RingRacers/releases/download/v${PV}/Dr.Robotnik.s-Ring-Racers-v${PV}-Assets.zip"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

BDEPEND="app-arch/unzip"

src_install() {
	insinto /usr/share/games/RingRacers/data
	doins data/*.pk3
	insinto /usr/share/games/RingRacers
	doins -r models
	doins bios.pk3
	doins models.dat
	doins gamecontrollerdb.txt
	insinto /usr/share/doc/ringracers
	doins PASSWORDS.txt
}
