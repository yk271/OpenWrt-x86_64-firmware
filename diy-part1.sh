#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# git checkout c2564b980dc41f251a7b010fe665c9176abefc4b ./package/default-settings/files/zzz-default-settings

git clone https://github.com/yk271/openwrt-passwall.git -b packages ./ext_package/passwall_package
git clone https://github.com/yk271/openwrt-passwall.git -b luci ./ext_package/passwall_luci

wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./ext_package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./ext_package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host

git clone https://github.com/jerrykuku/luci-theme-argon.git ./ext_package/luci-theme-argon-mod
#git clone https://github.com/yk271/luci-app-adguardhome.git ./ext_package/luci-app-adguardhome
