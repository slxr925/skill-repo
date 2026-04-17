# skill-repo

> 一个用来沉淀、整理、复用本地技能的仓库。

这里存放的是可以长期复用的 skill。它们不是一次性的任务记录，而是能够被反复调用的工作方法、操作流程和辅助脚本。

## 这个仓库是做什么的

- 收集可复用的 skill
- 给每个 skill 提供独立目录，便于扩展
- 将“给 agent 看的说明”与“给人看的说明”分开管理
- 为后续新增更多 skill 留出统一结构

## 仓库结构

所有 skill 都放在 `skills/<skill-name>/` 下面，避免仓库根目录越来越乱。

```text
skills/
  <skill-name>/
    README.md
    SKILL.md
    scripts/
    references/
    assets/
```

说明：

- `README.md`：给人看的，介绍这个 skill 是做什么的、适合什么场景
- `SKILL.md`：给 agent 看的，写触发条件、执行流程和注意事项
- `scripts/`：放这个 skill 依赖的辅助脚本
- `references/`：放按需查阅的参考资料
- `assets/`：放模板、素材或其他输出资源

按需创建目录即可，不要为了“结构完整”而放空文件夹。

## 当前已收录的 Skill

### `wechat-computer-use-send-message`

一个面向 macOS 桌面微信的消息发送 skill，重点解决 `computer use` 发送中文时的不稳定问题。

核心特点：

- 支持通过 `computer-use` 操作微信窗口
- 优先使用“剪贴板 + 粘贴 + 回车”的稳定路径
- 明确区分“真正发送成功”和“看起来执行成功”
- 自带一个剪贴板辅助脚本，减少重复操作

查看路径：

- [`skills/wechat-computer-use-send-message`](./skills/wechat-computer-use-send-message)

## 如何添加一个新的 Skill

1. 在 `skills/` 下新建一个独立目录。
2. 写好 `README.md`，先让人能快速看懂它的用途。
3. 写好 `SKILL.md`，明确触发条件、工作流程和失败恢复策略。
4. 只添加这个 skill 真正需要的脚本、引用资料或资源文件。
5. 保持根目录只放仓库级说明，不把单个 skill 的实现细节堆到外层。

## 设计原则

- 一个 skill 一个目录
- 面向人和面向 agent 的文档分开写
- 先保证可复用，再考虑花哨
- 结构要能自然扩展到多个 skill

## 未来可以继续补充

- 更多桌面自动化类 skill
- 面向文档处理、浏览器操作、工作流编排的 skill
- 每个 skill 对应的示例、测试样例和演示截图
