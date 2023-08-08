#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

rm -rf ./feeds/luci/applications/luci-app-passwall/root/etc/hotplug.d
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/0_default_config -O ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/0_default_config
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/proxy_host

git clone https://github.com/yk271/luci-app-adguardhome.git ./feeds/luci/applications/luci-app-adguardhome
