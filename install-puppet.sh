#!/bin/bash
BULLET="==>"

# always prefer puppet agent binaries
export PATH=/opt/puppetlabs/bin:$PATH

# OS X Major.Minor version
OSX_VER=`sw_vers -productVersion | grep -o "^[0-9]\+\.[0-9]\+"`

# Puppet agent version
PUPPET_VER=1.3.5

# Agent paths
PUPPET_PACKAGE="puppet-agent-${PUPPET_VER}-1.osx${OSX_VER}"
PUPPET_DMG="${PUPPET_PACKAGE}.dmg"

# install Puppet 
echo "${BULLET} Downloading Puppet agent v${PUPPET_VER}..."
[[ -f "/tmp/${PUPPET_DMG}" ]] || curl -L \
	-o /tmp/$PUPPET_DMG \
	"https://downloads.puppetlabs.com/mac/${OSX_VER}/PC1/x86_64/${PUPPET_DMG}"

echo "${BULLET} Mounting installer..."
[[ -d "/Volumes/${PUPPET_PACKAGE}" ]] || sudo hdiutil mount /tmp/$PUPPET_DMG

echo "${BULLET} Installing Puppet agent..."
which puppet 1>/dev/null || sudo installer \
	-pkg /Volumes/${PUPPET_PACKAGE}/puppet-agent-${PUPPET_VER}-1-installer.pkg \
	-target /
