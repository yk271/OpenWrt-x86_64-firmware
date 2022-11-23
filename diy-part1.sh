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
# 引入 AdGuardHome Luci，暂不编译核心（可能导致“启动项”中出现两个 AdGuardHome）
git clone https://github.com/yk271/luci-app-adguardhome.git ./package/luci-app-adguardhome
# Lede 自带 DDNS 插件似乎有 BUG，可能导致 Luci 卡顿，暂时使用独立插件
git clone https://github.com/yk271/openwrt-ddns-app.git ./package/openwrt-ddns-app
# 引入 Passwall 软件包和 Luci
git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages ./package/passwall_package
git clone https://github.com/yk271/openwrt-passwall.git -b luci ./package/passwall_luci
# 修改 Passwall 直连和代理列表
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/direct_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host
wget https://raw.githubusercontent.com/yk271/proxy-rule/main/proxy_host.txt -O ./package/passwall_luci/luci-app-passwall/root/usr/share/passwall/rules/proxy_host
# 引入老竭力的 Argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 ./package/luci-theme-argon
