<div align="center">

# 📱 wechat-computer-use-send-message

**面向 macOS 桌面微信的稳定消息发送 Skill**

[![Platform](https://img.shields.io/badge/Platform-macOS-blue?logo=apple)]()
[![Target](https://img.shields.io/badge/App-WeChat-green?logo=wechat)]()
[![Mode](https://img.shields.io/badge/Input-Clipboard--First-orange)]()

</div>

---

> 💡 **一句话介绍**：这个 skill 用来解决通过 `computer-use` 操作桌面微信时，中文消息“看起来输入了、实际上没发出去”的不稳定问题。

## ✨ 这个 Skill 是做什么的

| 目标 | 说明 |
|:---:|---|
| 🖥️ 自动化操作 | 通过 `computer-use` 操作 macOS 上的微信窗口 |
| 🇨🇳 稳定发中文 | 避开中文输入不稳定的问题，优先走剪贴板发送路径 |
| ✅ 强结果验证 | 不把“执行成功”当成“发送成功”，以聊天气泡为准 |
| 🔁 可重复使用 | 把一次真实踩坑过程整理成可长期复用的 skill |

---

## 🚨 它主要解决什么问题

通过 `computer-use` 操作桌面微信时，英文输入通常比较顺，但中文输入可能出现这种典型问题：

- 光标已经在输入框里
- 命令也执行成功了
- 但文字没有真正进入微信输入框
- 最终消息也没有发出去

这个 skill 的核心价值，就是把这类“假成功”收敛成一条更可靠、更可验证的发送流程。

---

## 🧠 核心思路

这套 skill 的重点不是“直接发”，而是“先确认，再发送”。

采用的稳定路径是：

1. 先确认当前微信窗口和目标聊天是否正确
2. 将待发送内容放进系统剪贴板
3. 使用粘贴快捷键把内容送进微信输入框
4. 先验证草稿已经真实出现在输入框里
5. 再按回车发送
6. 最后以聊天气泡是否出现作为成功标准

---

## 🚀 适用场景

- 需要通过桌面自动化操作微信
- 需要给指定联系人或群聊发送消息
- 直接输入中文不稳定，或者已经失败过
- 希望把“粘贴并发送”这件事做得更稳
- 希望以后重复使用同一套流程，而不是每次重新试错

---

## 📌 这个 Skill 为什么有价值

在桌面自动化里，最容易踩坑的往往不是“报错”，而是“不报错但结果不对”。

这个 skill 固定了几条已经验证过的经验：

| 经验 | 含义 |
|:---:|---|
| `type_text` 发英文可行 | 但发中文不一定可靠 |
| AppleScript 执行成功 | 不代表微信真的收到了文本 |
| 草稿可见才继续 | 输入框里看见文字，才允许发送 |
| 气泡出现才算成功 | 对话区出现发送气泡，才是真正完成 |

---

## 📂 目录说明

```text
wechat-computer-use-send-message/
  ├── README.md
  ├── SKILL.md
  └── scripts/
        └── copy_wechat_message.sh
```

说明：

- [`README.md`](./README.md)
  给人看的说明，介绍这个 skill 解决什么问题、适合什么场景
- [`SKILL.md`](./SKILL.md)
  给 agent 看的正式说明，包含触发条件、工作流程、失败恢复和注意事项
- [`scripts/copy_wechat_message.sh`](./scripts/copy_wechat_message.sh)
  一个小脚本，用来把待发送文本放进 macOS 剪贴板

---

## 👥 适合谁用

- 需要做桌面自动化的人
- 需要沉淀本地 skill 的人
- 想把一次真实踩坑过程变成可复用方法的人
- 想让 AI Agent 在微信桌面操作里更稳一点的人

---

## 🎯 一句话总结

如果你想通过 `computer-use` 给微信发消息，尤其是发中文，这个 skill 的价值就在于：它帮你绕开“命令没报错，但消息其实没发出去”的假成功。

---

<div align="center">

**Built for reliable desktop messaging workflows**

</div>
