# Issue 1: Hugo 项目初始化 + 首页与文章详情

## Parent

PRD: 个人博客网站 — 复刻 yangzhiping.com (`../PRD.md`)

## What to build

初始化 Hugo 项目并搭建两条核心路径：首页显示文章列表，文章详情页展示完整内容。这是博客的"脊椎"，后续所有功能都建立在此之上。

端到端交付：
- 初始化 Hugo 站点骨架
- 首页渲染文章列表（标题、日期、摘要、标签）
- 点击文章进入详情页（完整 Markdown 内容 + 代码高亮 + 目录导航 + 阅读时间估算）
- 本地 `hugo server` 可预览

## Acceptance criteria

- [ ] `hugo new site` 初始化项目，`.gitignore` 正确排除 `public/` 和 `resources/`
- [ ] `hugo.yaml` 配置完成（站点标题、基础 URL、语言、主题参数）
- [ ] 首页显示文章列表：每篇展示标题、发布日期、标签、摘要（不少于 3 篇 demo 文章）
- [ ] 文章详情页渲染 Markdown 内容，支持 front matter 元数据
- [ ] 代码块有语法高亮
- [ ] 文章内显示目录导航（Table of Contents），支持锚点跳转
- [ ] 文章顶部显示阅读时间估算（基于中文字数计算）
- [ ] 文章页显示标签链接（暂不跳转标签页，由 #2 实现）
- [ ] `hugo server` 可正常运行，热更新生效

## Blocked by

None - can start immediately
