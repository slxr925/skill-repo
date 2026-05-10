# 2026-05-10 Weekly Skill Summary

本周主要对话可以分成四类：

## 1. `myblog` 项目相关工作

- 读仓库结构、检索链路、metadata 使用方式和 DLQ 设计
- 评估简历里 MyBlog 项目的表述是否准确
- 讨论 Spring AI 介绍与 README 说明的更新
- 清理本地 Codex 工作区、runtime、缓存和分支

结论：

- 这些对话偏项目内实现和说明改写，复用价值有限
- 不适合单独沉淀成新 skill

## 2. Douyin 内容抽取到 Markdown / Notion

- 解析 Douyin 短链
- 抽取视频信息、音频转写和正文结构
- 生成 Markdown
- 同步到 Notion 指定层级

结论：

- 这类流程已经在仓库里的 `social-content-to-notion-md` 里覆盖
- 本周没有必要重复提炼成新 skill

## 3. 既有 skill 仓库的整理与同步

- 修正 `skill-repo` 的 GitHub 同步问题
- 调整 README 展示和 skill 列表
- 提交并推送仓库改动

结论：

- 这是维护动作，不是新的可复用工作方法
- 不作为新 skill 收录

## 4. Codex reconnecting + 本地 HTTP 代理

- Codex Desktop 在 macOS 上一直 `reconnecting`
- 先确认本地代理进程和监听端口
- 找到 Loon 的本地 HTTP/HTTPS 代理端口
- 写入 `~/.codex/.env`
- 用显式代理参数启动 Codex
- 验证链路可用后再判断是否修复

结论：

- 这是本周最有价值、且当前 skill hub 里没有现成覆盖的流程
- 已提炼成新 skill：`codex-macos-local-http-proxy-reconnect`

## 本周新增 skill

1. `codex-macos-local-http-proxy-reconnect`

## 已有 skill，不重复新增

1. `slow-sql-design-docx`
2. `social-content-to-notion-md`
3. `wechat-computer-use-send-message`

