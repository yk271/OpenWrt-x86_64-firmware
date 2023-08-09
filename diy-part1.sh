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

git checkout a76f816d04d130d6c431bdb15e6a136542d458b9
git clone https://github.com/yk271/openwrt-packages.git ./package/yk271-packages
