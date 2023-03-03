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

# 回退 dnsmasq 版本
# git checkout 727d803cb09ad4bd2bb1b178f9fd44e9bf1f2595 ./package/network/services/dnsmasq

# git clone https://github.com/yk271/luci-app-adguardhome-1.git ./package/luci-app-adguardhome

git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages ./package/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci ./package/passwall_luci
# rm -rf ./package/passwall_luci/luci-app-passwall/root/etc/hotplug.d
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host

git clone https://github.com/jerrykuku/luci-theme-argon.git ./package/luci-theme-argon-mod
