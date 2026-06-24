#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 删除多余无用插件
sed -i '/CONFIG_PACKAGE_luci-app-watchcat/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-wol/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-kms/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-frpc/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-natmap/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-upnp/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-xunlei/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-ddns-go/d' .config

# 屏蔽v2ray/xray，彻底解决golang1.25编译冲突
sed -i '/CONFIG_PACKAGE.*v2ray/d' .config
sed -i '/CONFIG_PACKAGE.*xray/d' .config

# 仅保留Argon主题
sed -i '/luci-theme-bootstrap/d' .config
sed -i '/luci-theme-material/d' .config
sed -i '/luci-theme-openwrt/d' .config

# 基础网络组件强制启用
echo 'CONFIG_PACKAGE_dnsmasq-full=y' >> .config
echo 'CONFIG_PACKAGE_firewall=y' >> .config

# RAX3000Q WiFi优化参数
sed -i '104a set wireless.radio${devidx}.rts=2347\
set wireless.radio${devidx}.frag=1500' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 开启Passwall全套编译
# echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
# echo 'CONFIG_PACKAGE_luci-app-passwall2=y' >> .config
