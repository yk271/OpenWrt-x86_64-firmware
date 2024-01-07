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

# 修改内核版本
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile

# 回退 dnsmasq 版本
#git checkout 81a3a0ff39290e874d9ef9c9db52d2dfae9f40ca ./package/network/services/dnsmasq

#git clone https://github.com/yk271/openwrt-packages.git ./package/yk271-packages

# 修改 firewall 配置，默认开启 fullcone
wget https://raw.githubusercontent.com/yk271/OpenWrt-x86_64-firmware/lede-18.06/ExtraFiles/firewall.config -O ./package/network/config/firewall/files/firewall.config
# 修改 dhcp 配置，默认禁用 IPv6 解析、关闭重绑定保护
wget https://raw.githubusercontent.com/yk271/OpenWrt-x86_64-firmware/lede-18.06/ExtraFiles/dhcp.conf -O ./package/network/services/dnsmasq/files/dhcp.conf

git clone https://github.com/xiaorouji/openwrt-passwall-packages.git -b main ./package/passwall_packages
# 暂时回滚至上一个版本的 sing-box
cd ./package/passwall_packages
git reset --hard 4891edc8af1a75ed7ed3c3bab4d111fa68601ca4
cd ../../
git clone https://github.com/xiaorouji/openwrt-passwall.git -b main ./package/passwall_luci
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/block_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/block_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/0_default_config -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/0_default_config
rm -rf ./package/passwall_luci/luci-app-passwall/root/etc/hotplug.d

git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 ./package/luci-theme-argon
wget https://raw.githubusercontent.com/yk271/OpenWrt-x86_64-firmware/lede-18.06/ExtraFiles/rideshare_feature_compress.jpg -O ./package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
