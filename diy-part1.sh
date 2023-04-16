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

git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages ./package/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci ./package/passwall_luci
# rm -rf ./package/passwall_luci/luci-app-passwall/root/etc/hotplug.d
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host

git clone https://github.com/jerrykuku/luci-theme-argon.git ./package/luci-theme-argon-mod
git checkout f273a9147c55087c8480c8df65e7c61df4e337f3 ./package/luci-theme-argon-mod
