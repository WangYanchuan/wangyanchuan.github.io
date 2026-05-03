# Issue 5: GitHub Actions 自动部署到 Pages

## Parent

PRD: 个人博客网站 — 复刻 yangzhiping.com (`../PRD.md`)

## What to build

配置 GitHub Actions CI/CD 流水线，实现 push 到 main 分支后自动构建 Hugo 站点并部署到 GitHub Pages。

## Acceptance criteria

- [ ] `.github/workflows/deploy.yml` 定义 GitHub Actions workflow
- [ ] workflow 使用 `actions/checkout` + `peaceiris/actions-hugo` 构建站点
- [ ] workflow 使用 `peaceiris/actions-gh-pages` 部署到 `gh-pages` 分支
- [ ] 构建脚本通过 `hugo --minify` 生成优化后的静态文件
- [ ] GitHub Pages 源设置为 `gh-pages` 分支的根目录
- [ ] 首次部署后站点可通过 `<username>.github.io/<repo>` 访问
- [ ] 部署失败时 workflow 发送通知

## Blocked by

- #1 Hugo 项目初始化 + 首页与文章详情
