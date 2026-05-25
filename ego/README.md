# ego

`ego` 是一个 iOS 越狱微信插件，源于“软拉黑”理念：
保留最基本聊天能力，屏蔽好友资料、朋友圈展示与所有头像，专注自己，不再被社交动态打扰。

## 核心理念
- 软拉黑：不删好友、不拉黑，只屏蔽视觉展示
- 专注自己：隐藏社交干扰，保留最纯粹的聊天体验
- 轻量高效：仅 Hook 已知微信视图，避免多余性能开销

## 功能说明
- 隐藏微信指定复用 ID 的 `MMTableViewCell`
- 隐藏微信内所有 `MMUILongPressImageView` 头像
- 屏蔽资料/朋友圈展示入口，减少社交曝光
- 可与其他插件组合使用，进一步屏蔽更多社交动态

## 环境要求
### 开发环境
- Xcode 14.0+
- iOS 越狱开发环境（MonkeyDev / Theos 可选）
- macOS 12.0+

### 运行环境
- iOS 12.0+ 越狱设备
- arm64 / arm64e 架构
- 已安装 Cydia Substrate / Substitute
- 微信应用（插件通过 Hook 微信视图实现屏蔽效果）

## 编译步骤
1. 进入工程目录：
   ```bash
   cd ego/ego
   ```
2. 打开 `ego.xcodeproj`；
3. 选择 `Generic iOS Device`；
4. 确认 Target 链接了 `UIKit.framework` 和 `CydiaSubstrate.framework`；
5. 执行 `Product -> Build`；

## 安装方法
### 推荐：Deb 包方式
1. 将 `ego.dylib` 和 `ego.plist` 打包为 Debian 包；
2. 通过 Cydia / Sileo / Aptitude 安装；
3. 重启设备或 SpringBoard；

### 手动部署方式
1. 将 `ego.dylib` 和 `ego.plist` 上传到设备：
   ```bash
   scp ego.dylib root@<设备IP>:/Library/MobileSubstrate/DynamicLibraries/
   scp ego.plist root@<设备IP>:/Library/MobileSubstrate/DynamicLibraries/
   ```
2. 重启 SpringBoard：
   ```bash
   ssh root@<设备IP> "killall SpringBoard"
   ```

## 核心实现
- Hook `MMTableViewCell` 的 `layoutSubviews`：匹配目标复用 ID 后隐藏 Cell，并移除内容视图。
- Hook `MMUILongPressImageView` 的 `initWithFrame:` 与 `layoutSubviews`：创建阶段与布局阶段都保持隐藏，避免头像闪现。
- 目标 ID 包括：
  - `WCCellReuseIdentifier_110.000000`
  - `WCCellReuseIdentifier_80.000000`
  - `WCCellReuseIdentifier_56.000000`

## 注意事项
- 仅支持真实越狱设备，不支持模拟器；
- 插件仅针对微信视图显示做隐藏处理，不发送网络请求；
- 本项目仅供学习与研究使用，请遵守相关法规与使用规范。
