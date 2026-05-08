<div align="center">

# 🧠 Skill Repo

**沉淀 · 整理 · 复用 — 本地 AI Agent 技能仓库**

[![GitHub](https://img.shields.io/badge/Platform-macOS-blue?logo=apple)]()
[![GitHub](https://img.shields.io/badge/Skills-4-green?logo=git)]()
[![GitHub](https://img.shields.io/badge/License-MIT-yellow)]()

</div>

---

> 💡 **一句话介绍**：这里存放的是可以长期复用的 skill —— 不是一次性的任务记录，而是能被反复调用的工作方法、操作流程和辅助脚本。

## ✨ 这个仓库是做什么的

| 目标 | 说明 |
|:---:|---|
| 📦 收集 | 把可复用的 skill 沉淀下来，不再每次从零开始 |
| 🗂️ 整理 | 每个 skill 独立目录，结构清晰，方便扩展 |
| 📄 双文档 | "给 agent 看的说明"和"给人看的说明"分开管理 |
| 🧩 可扩展 | 统一结构，后续新增 skill 无需改动现有布局 |

---

## 📂 仓库结构

所有 skill 统一放在 `skills/<skill-name>/` 下，避免根目录越来越乱：

```text
skills/
  └── <skill-name>/
        ├── 📄 README.md      ← 给人看的：用途、适用场景
        ├── 🤖 SKILL.md       ← 给 agent 看的：触发条件、执行流程、失败恢复
        ├── 📜 scripts/       ← 依赖的辅助脚本
        ├── 📚 references/    ← 按需查阅的参考资料
        └── 🎨 assets/        ← 模板、素材或其他输出资源
```

> 📌 **原则**：按需创建目录，不要为了"结构完整"而放空文件夹。

---

## 🚀 已收录的 Skill

### 📄 slow-sql-design-docx

> 根据慢 SQL 分析 Excel、上线包中的实际索引 DDL、以及 Word 模板，生成谨慎的慢 SQL 优化概要设计文档。

| 特性 | 描述 |
|:---:|---|
| 📊 Excel 取证 | 读取慢 SQL 分类、原因、建议和整改状态 |
| 🧾 脚本定界 | 以上线包 DDL 作为本次实施范围，不扩大描述 |
| 📄 模板填充 | 保留 DOCX 模板结构，生成新文档而非覆盖原件 |
| ✅ 校验优先 | 检查上线/回退 SQL、模板残留和未知字段 |

👉 查看详情：[skills/slow-sql-design-docx](./skills/slow-sql-design-docx)

---

### 📱 wechat-computer-use-send-message

> 面向 macOS 桌面微信的消息发送 skill，重点解决 `computer-use` 发送中文时的不稳定问题。

| 特性 | 描述 |
|:---:|---|
| 🖥️ 桌面自动化 | 通过 `computer-use` 直接操作微信窗口 |
| 📋 剪贴板优先 | 采用"剪贴板 + 粘贴 + 回车"的稳定路径发送中文 |
| ✅ 结果验证 | 明确区分"真正发送成功"和"看起来执行成功" |
| 🔧 辅助脚本 | 自带剪贴板工具脚本，减少重复操作 |

👉 查看详情：[skills/wechat-computer-use-send-message](./skills/wechat-computer-use-send-message)

---

### 📰 social-content-to-notion-md

> 把 Douyin、小红书、截图型帖子里的内容提取出来，整理成适合复盘和归档的 Markdown，再按需同步到 Notion。

| 特性 | 描述 |
|:---:|---|
| 🎬 多来源抽取 | 支持短链、视频页、图文帖和截图内容 |
| 🔎 先取事实 | 优先提取视频转写、图片 OCR、标题和正文，再做总结 |
| 📝 Markdown 输出 | 生成适合直接存档的中文笔记结构 |
| 🗂️ Notion 同步 | 可写入用户指定的 Notion 页面或目录 |

👉 查看详情：[skills/social-content-to-notion-md](./skills/social-content-to-notion-md)

---

### 🧾 codebase-backed-ai-resume-tailoring

> 基于真实代码库证据重写简历项目经历，重点突出 AI、RAG、Tool Use、流式输出、缓存和可观测性等可验证能力。

| 特性 | 描述 |
|:---:|---|
| 🔍 代码取证 | 从服务、配置、测试和 API 入口提炼真实能力 |
| 🧠 AI 岗聚焦 | 针对 AI 应用开发、平台工程和大模型落地岗位优化措辞 |
| ✍️ 简历改写 | 输出可直接替换的中文 LaTeX 或项目 bullet |
| 🧾 严格保真 | 只写代码里能证明的内容，避免夸大 |

👉 查看详情：[skills/codebase-backed-ai-resume-tailoring](./skills/codebase-backed-ai-resume-tailoring)

---

## 🛠️ 如何添加一个新的 Skill

1. 📁 在 `skills/` 下新建一个独立目录
2. 📝 写好 `README.md`，先让人能快速看懂它的用途
3. 🤖 写好 `SKILL.md`，明确触发条件、工作流程和失败恢复策略
4. 📦 只添加这个 skill 真正需要的脚本、引用资料或资源文件
5. 🧹 保持根目录只放仓库级说明，不把单个 skill 的实现细节堆到外层

---

## 🎯 设计原则

- 🗃️ **一个 skill 一个目录** — 互不干扰，独立维护
- 👥🤖 **人机文档分离** — README 给人看，SKILL 给 agent 看
- 🔁 **先可用再完善** — 先保证可复用，再考虑花哨
- 📈 **自然扩展** — 结构要能平滑扩展到多个 skill

---

## 🗺️ 未来计划

- 🖥️ 更多桌面自动化类 skill
- 📄 面向文档处理、浏览器操作、工作流编排的 skill
- 🧪 每个 skill 对应的示例、测试样例和演示截图

---

<div align="center">

**Made with ❤️ by [slxr925](https://github.com/slxr925)**

⭐ 觉得有用？点个 Star 支持一下！

</div>
