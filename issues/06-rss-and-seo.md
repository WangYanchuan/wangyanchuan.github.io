# Issue 6: RSS 订阅 + SEO

## Parent

PRD: 个人博客网站 — 复刻 yangzhiping.com (`../PRD.md`)

## What to build

为博客添加 RSS 订阅支持和搜索引擎优化，让访问者可以订阅更新，让搜索引擎可以正确索引内容。

## Acceptance criteria

- [ ] RSS feed 自动生成，路径为 `/index.xml`
- [ ] RSS feed 包含每篇文章的完整内容或摘要 + 链接
- [ ] `sitemap.xml` 自动生成，包含所有页面
- [ ] 每篇文章页面有正确的 `<title>` 和 `<meta description>`
- [ ] 首页有适当的 meta 标签（站点描述、关键词）
- [ ] 支持 Open Graph 标签（og:title, og:description, og:type）用于社交分享
- [ ] 规范 URL，避免重复内容（canonical link）

## Blocked by

- #1 Hugo 项目初始化 + 首页与文章详情
