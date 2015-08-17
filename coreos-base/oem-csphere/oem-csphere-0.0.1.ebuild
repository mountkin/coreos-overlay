# Copyright (c) 2014 NIFTY Corp.. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="OEM suite for Csphere images"
HOMEPAGE=""
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# no source directory
S="${WORKDIR}"

DEPEND="
	"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e "s\\@@OEM_VERSION_ID@@\\${PVR}\\g" \
	    "${FILESDIR}/cloud-config.yml" > "${T}/cloud-config.yml" || die
}

src_install() {
	into "/usr/share/csphere"

	insinto "/usr/share/csphere"
	doins "${T}/cloud-config.yml"
	doins "${FILESDIR}/oem-release"
	doins "${FILESDIR}/helloworld"
}
