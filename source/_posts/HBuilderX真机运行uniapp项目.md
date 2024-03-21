---
title: iOS 设备真机运行 uniapp 项目
date: 2024-03-21 01:17:26
tags:
toc: true
---


# iOS设备真机运行uniapp项目

在windows电脑上：

1. 下载安装iTunes，安装包见学习通资料，请勿在微软应用商店中直接下载（[详见](https://uniapp.dcloud.net.cn/tutorial/run/run-app-faq.html#_4-2-%E6%A3%80%E6%B5%8Bios%E6%89%8B%E6%9C%BA)）。

2. 打开iTunes连接iPhone，直到【iTunes左栏-设备】中显示手机详细信息。❗注意：以下步骤请全程保持手机连接，不要拔掉数据线。

3. 下载安装爱思助手，安装包见学习通资料。

4. 在资源管理器中找到iOS标准基座路径：HBuilderX安装目录\plugins\launcher\base\iPhone_base.ipa，找到ipa文件。

   ![img](https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/windows_ios%E6%A0%87%E5%87%86%E5%9F%BA%E5%BA%A7%E7%AD%BE%E5%90%8D_1.jpg)

5. 打开爱思助手，显示设备已连接，点击【工具箱-ipa签名】，点击【添加IPA文件】，根据步骤4的路径选中ipa文件，点击打开。[-](https://uniapp.dcloud.net.cn/tutorial/run/ios-apple-certificate-signature.html)

6. 点击【使用Apple ID签名】，点击【添加Apple ID】，勾选上ipa文件和Apple ID之后，点击开始签名。

   ![img](https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/windows_ios%E6%A0%87%E5%87%86%E5%9F%BA%E5%BA%A7%E7%AD%BE%E5%90%8D_2.jpg)

7. 签名成功后，点击【打开已签名IPA位置】，找到ipa文件，重命名为“iPhone_base_signed.ipa”

8. 将步骤7的文件复制到步骤4的文件夹中：HBuilderX安装目录\plugins\launcher\base\。

   ![img](https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/windows_ios%E6%A0%87%E5%87%86%E5%9F%BA%E5%BA%A7%E7%AD%BE%E5%90%8D_3.jpg)

9. 打开HBuilderX，选择要运行的项目，点击工具栏运行图标，选择【运行到iOS App基座】。

   ![img](https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/windows_ios%E6%A0%87%E5%87%86%E5%9F%BA%E5%BA%A7%E7%AD%BE%E5%90%8D_4.jpg)

10. 打开iPhone，点击HBuilder，如果显示“不受信任的开发者：您的设备管理设置不允许在此台iPhone上使用开发者"XXX"的应用您可以在"设置"中允许使用这些应用”，打开【设置-通用-VPN与设备管理】，在开发者APP中点击信任。

11. 打开【设置-隐私与安全性】，最下方打开【安全性-开发者模式】，重启设备。

12. 打开HBuilder，开始真机调试项目。



# Android设备真机运行uniapp项目

在windows电脑上：

1. 连接手机，开启【USB调试模式】，详见[文档1](https://uniapp.dcloud.net.cn/tutorial/run/run-app-faq.html#%E7%AC%AC3%E6%AD%A5-%E7%94%B5%E8%84%91%E4%B8%8E%E6%89%8B%E6%9C%BA%E6%98%AF%E5%90%A6%E5%BB%BA%E7%AB%8B%E4%BF%A1%E4%BB%BB%E8%B0%83%E8%AF%95%E5%85%B3%E7%B3%BB)，[文档2](https://uniapp.dcloud.net.cn/tutorial/run/run-app-faq.html#%E7%AC%AC3%E6%AD%A5-%E7%94%B5%E8%84%91%E4%B8%8E%E6%89%8B%E6%9C%BA%E6%98%AF%E5%90%A6%E5%BB%BA%E7%AB%8B%E4%BF%A1%E4%BB%BB%E8%B0%83%E8%AF%95%E5%85%B3%E7%B3%BB)。
2. 打开HBuilderX，选择要运行的项目，点击工具栏运行图标，选择【运行到Android App基座】