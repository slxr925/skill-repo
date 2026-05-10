# codex-macos-local-http-proxy-reconnect

解决 Codex Desktop 在 macOS 上反复 `reconnecting` 时，如何用本地 HTTP 代理稳定启动，并把代理配置写入 `~/.codex/.env`。

## 适用场景

- Codex Desktop 一直卡在 `reconnecting`
- 本机已经有可用的 HTTP 代理，比如 Loon、Clash、Surge 或同类工具
- 需要把 Codex 明确切到本地代理，而不是依赖系统默认网络
- 需要保留一份可重复执行的启动方式和环境变量配置

## 核心价值

- 先确认代理端口，再写入环境变量
- 同时写入大小写两套代理变量，兼容不同读取习惯
- 把 `~/.codex/.env` 当作固定入口，而不是临时手改
- 用显式启动参数减少“看起来已连接、其实还在抖”的情况

## 这个 skill 输出什么

- 本地代理地址和端口
- 可直接复用的 `~/.codex/.env` 内容
- 一条可用的 Codex 启动命令
- 一组最小验证步骤，用来判断代理链路是否真的通了

