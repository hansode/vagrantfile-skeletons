#!/bin/bash
#
# requires:
#  bash
#
set -e
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# in order to install packages, remove the '_' prefix from "_addpkgs".
_addpkgs="
 man
 sudo rsync git make
 vim-minimal screen
 nmap lsof strace tcpdump traceroute telnet ltrace bind-utils sysstat nc
 gcc-c++ gcc

 qemu-kvm qemu-img
 parted kpartx
 bridge-utils tunctl
 ebtables iptables ethtool vconfig iproute
 curl
"

if [[ -n "${addpkgs}" ]]; then
  yum install -y ${addpkgs}
fi
