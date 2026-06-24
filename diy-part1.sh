#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 仅拉取Passwall源码
git clone https://mirror.ghproxy.com/https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
git clone https://mirror.ghproxy.com/https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall2
