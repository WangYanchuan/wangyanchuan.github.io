---
title: "Hugo入门指南"
date: 2026-04-28
tags: ["Hugo", "静态站点", "教程"]
summary: "Hugo是一个用Go语言编写的静态站点生成器，以构建速度快、使用简单著称。本文介绍Hugo的基本使用方法和最佳实践。"
---

## 什么是 Hugo

Hugo 是当今最流行的静态站点生成器之一，由 Go 语言编写，以其惊人的构建速度而闻名。一个包含数百页的站点可以在毫秒级别完成构建。

## 安装 Hugo

在 macOS 上安装 Hugo 非常简单：

```bash
brew install hugo
```

安装完成后，验证版本：

```bash
hugo version
```

## 创建新站点

```bash
hugo new site my-blog
cd my-blog
```

## 添加内容

Hugo 使用 Markdown 文件管理内容，每篇文章通过 front matter 定义元数据：

```yaml
---
title: "我的第一篇文章"
date: 2026-04-28
tags: ["Hugo", "教程"]
---
```

## 本地预览

```bash
hugo server -D
```

然后在浏览器中打开 `http://localhost:1313` 即可预览。

## 构建部署

```bash
hugo --minify
```

构建后的静态文件输出到 `public/` 目录，可以直接部署到任何静态托管服务。
