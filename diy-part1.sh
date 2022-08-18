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
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.19/g' ./target/linux/x86/Makefile

# 删除密码
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' ./package/lean/default-settings/files/zzz-default-settings

# 添加软件源码
svn export https://github.com/kenzok8/small-package/trunk/luci-app-adguardhome ./package/luci-app-adguardhome
svn export https://github.com/kenzok8/small-package/trunk/adguardhome ./package/adguardhome
rm -rf ./package/adguardhome/patches

svn export https://github.com/kenzok8/small-package/trunk/luci-app-aliddns ./package/luci-app-aliddns

git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages ./package/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci ./package/passwall_luci
wget https://fastly.jsdelivr.net/gh/yk271/proxy-rule/direct_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://fastly.jsdelivr.net/gh/yk271/proxy-rule/proxy_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host

git clone https://github.com/yk271/luci-app-tencentddns.git ./package/luci-app-tencentddns
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 ./package/luci-theme-argon
