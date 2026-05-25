# ego

`ego` 是一个 iOS 越狱微信界面屏蔽插件，核心目标是“软拉黑”：
保留最基本聊天能力，彻底屏蔽朋友圈/资料展示与所有头像，专注自己，不去关注他人。

## 核心理念
- 软拉黑：仅隐藏视觉展示，不改变聊天功能
- 专注自己：屏蔽社交动态、好友资料与头像，减少外界干扰
- 极致轻量：仅对已知微信视图进行 Hook，无冗余消费

## 功能说明
- 屏蔽微信中特定空间展示
- 屏蔽好友资料和朋友圈展示
- 屏蔽所有头像显示
- 可与其他插件配合，屏蔽更多社交动态
- 仅保留基础聊天能力，不影响消息收发

## 项目结构
- `ego/`：插件源码与 Xcode 工程
- `ego/Package/`：DEB 包结构
- `ego/Package/Library/MobileSubstrate/DynamicLibraries/`：最终插件 `ego.dylib` 和 `ego.plist`

## 编译要求
- Xcode 14.0+
- iOS 12.0+ 越狱设备
- arm64/arm64e 设备架构
- 已安装 Cydia Substrate / Substitute
- 推荐在真实设备上编译运行，不支持模拟器

## 运行与安装
1. 打开 `ego/ego.xcodeproj`
2. 选择 `Generic iOS Device`
3. 编译并生成 `ego.dylib`
4. 将 `ego.dylib` 和 `ego.plist` 部署到设备：
   - `/Library/MobileSubstrate/DynamicLibraries/`
5. 重启 SpringBoard 或设备

## 免责声明
本项目仅供技术学习、研究与个人使用。请勿用于违反微信用户协议或相关法律法规的场景。使用产生的后果由使用者自行承担。
