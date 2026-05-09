# LuThesis

**L**anzhou **U**niversity of **T**echnology **Thesis** LaTeX Template

兰州理工大学学位论文 LaTeX 模板，支持硕士毕业论文格式。基于 [ThuThesis](https://github.com/xueruini/thuthesis) v5.3.2 改编。

## 编译方式

本模板必须使用 **XeLaTeX** 编译：

```bash
xelatex main.tex
xelatex main.tex
```

需要编译两遍以生成正确的目录和交叉引用。

## 环境要求

- TeX 发行版：MiKTeX 或 TeX Live
- 编译引擎：XeLaTeX
- 编辑器：VSCode + LaTeX Workshop / TeXStudio 等均可

## 字体配置

模板已将所有必需字体打包在 `fonts/` 目录中，无需额外安装：

| 字体文件 | 用途 |
|---------|------|
| simsun0.ttf | 宋体（中文正文） |
| simhei.ttf | 黑体（中文标题） |
| simkai.ttf | 楷体（中文斜体） |
| simfang.ttf | 仿宋（封面等） |
| times.ttf / timesbd.ttf / timesi.ttf / timesbi.ttf | Times New Roman（西文） |
| DejaVuSans.ttf | 特殊符号 |

如需替换 DejaVu Sans 为其他字体，修改 `thuthesis.cls` 中对应的 `\newfontfamily\DejaSans` 行即可。

DejaVu Sans 下载地址：https://dejavu-fonts.github.io/Download.html

## 项目结构

```
├── main.tex              主文件
├── thuthesis.cls         文档类
├── thuthesis.cfg         配置文件（个人信息）
├── thuthesis.sty         额外宏包
├── fonts/                字体目录
├── data/                 章节内容
│   ├── cover.tex         封面
│   ├── chap01.tex        第一章
│   ├── chap02.tex        第二章
│   ├── conclusion.tex    结论
│   ├── references.tex    参考文献
│   └── acknowledgment.tex 致谢
├── figures/              图片目录
└── ref/                  参考文献数据库
```

## 清理中间文件

```bash
rm -f main.aux main.log main.out main.toc main.lof main.lot main.loa main.bbl main.blg main.synctex.gz main.thm main.fls main.fdb_latexmk
```

## 致谢

本模板基于清华大学 ThuThesis 模板修改，感谢原作者的贡献。
