# LuThesis

**L**anzhou **U**niversity of **T**echnology **Thesis** LaTeX Template

兰州理工大学学位论文 LaTeX 模板。基于 [ThuThesis](https://github.com/xueruini/thuthesis) v5.3.2 改编。

- `graduate` 分支：硕士/博士研究生学位论文
- `bachelor` 分支：本科毕业设计

## 快速开始

1. 克隆仓库并切换到对应分支：

```bash
git clone https://github.com/longzheng268/LaTeX_Thesis_Template_for_Lanzhou_University_of_Technology.git
cd LaTeX_Thesis_Template_for_Lanzhou_University_of_Technology

# 研究生
git checkout graduate

# 本科生
git checkout bachelor
```

2. 修改 `data/cover.tex` 中的个人信息
3. 编写正文章节（`data/chap01.tex` 等）
4. 编译：

```bash
# 推荐：latexmk 自动编译（需安装 Perl）
latexmk -xelatex main.tex

# 或手动编译
xelatex main.tex
bibtex main     # 有参考文献时
xelatex main.tex
xelatex main.tex
```

## 环境要求

- TeX 发行版：MiKTeX 或 TeX Live（2020 及以上版本）
- 编译引擎：XeLaTeX（不支持 pdfLaTeX）
- [Perl](https://www.perl.org/get.html)（仅使用 latexmk 自动编译时需要，Scoop 用户可 `scoop install perl`）
- 编辑器：VSCode + LaTeX Workshop / TeXStudio / Overleaf 等均可

### VSCode LaTeX Workshop 配置

打开 VSCode 用户设置（`Ctrl+Shift+P` → "Open User Settings (JSON)"），添加以下配置：

```jsonc
{
  // 编译工具定义
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": ["-interaction=nonstopmode", "-synctex=1", "-file-line-error", "%DOC%"]
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": ["-interaction=nonstopmode", "-synctex=1", "-file-line-error", "%DOC%"]
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": ["%DOCFILE%"]
    },
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-xelatex", "-interaction=nonstopmode", "-synctex=1", "-file-line-error", "%DOC%"]
    }
  ],
  // 编译配方：第一个为默认，按 Ctrl+Alt+B 可切换
  "latex-workshop.latex.recipes": [
    {
      "name": "latexmk (XeLaTeX)",
      "tools": ["latexmk"]
    },
    {
      "name": "XeLaTeX (中文, 手动)",
      "tools": ["xelatex", "bibtex", "xelatex", "xelatex"]
    },
    {
      "name": "pdfLaTeX (English)",
      "tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
    }
  ],
  "latex-workshop.latex.recipe.default": "first",
  "latex-workshop.latex.autoBuild.run": "onSave"
}
```

- **latexmk (XeLaTeX)**：默认配方，自动判断是否需要 bibtex，推荐使用（需要安装 Perl）
- **XeLaTeX (中文, 手动)**：手动编译流程，适合不需要 Perl 的环境
- **pdfLaTeX (English)**：纯英文文档使用

按 `Ctrl+Alt+B` 可手动选择编译配方。

## 填写个人信息

编辑 `data/cover.tex`，修改以下字段：

```latex
\thusetup{
  stunum={你的学号},
  ctitle={你的论文题目},
  cdegree={硕士},              % 或 博士
  cdepartment={你的学院},
  cmajor={你的学科专业},
  researchdirect={研究方向},
  cauthor={你的姓名},
  csupervisor={导师姓名 职称},
  submitdate={2025年6月1日},
  replydate={2025年6月15日},
  chairman={答辩委员会主席},
  etitle={English Title},
  edegree={Master of Engineering},
  eauthor={Your Name},
  esupervisor={Professor XXX},
  ckeywords={关键词1, 关键词2, 关键词3},
  ekeywords={Keyword 1, Keyword 2, Keyword 3}
}
```

中英文摘要在同一文件中的 `cabstract` 和 `eabstract` 环境内编写。

## 编写正文

在 `data/` 目录下创建章节文件，然后在 `main.tex` 中引入：

```latex
\mainmatter
\include{data/chap01}
\include{data/chap02}
\include{data/chap03}
```

每个章节文件以 `\chapter{章标题}` 开头：

```latex
\chapter{绪论}
\label{ch:intro}

\section{研究背景}

正文内容...

\subsection{小节标题}

正文内容...
```

### 插入公式

行内公式用 `$...$`，行间公式用 `equation` 环境：

```latex
前向过程定义为：
\begin{equation}
    \label{equ:forward}
    q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1-\beta_t} x_{t-1}, \beta_t \mathbf{I})
\end{equation}

由公式~\ref{equ:forward} 可知...
```

### 插入图片

图片放在 `figures/` 目录下，支持 PDF、PNG、JPG 格式：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{fig_name.png}
    \caption{图片标题}
    \label{fig:label}
\end{figure}

如图~\ref{fig:label} 所示...
```

注意：PDF 格式引用时不写扩展名，PNG/JPG 需要写扩展名。

### 插入表格

```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \label{tab:label}
    \begin{tabular}{ccc}
        \toprule[1.5pt]
        列1 & 列2 & 列3 \\
        \midrule[0.5pt]
        数据1 & 数据2 & 数据3 \\
        数据4 & 数据5 & 数据6 \\
        \bottomrule[1.5pt]
    \end{tabular}
\end{table}

如表~\ref{tab:label} 所示...
```

### 插入列表

```latex
% 有序列表
\begin{enumerate}
    \item 第一条内容。
    \item 第二条内容。
\end{enumerate}

% 无序列表
\begin{itemize}
    \item 第一项内容；
    \item 第二项内容。
\end{itemize}
```

### 交叉引用

```latex
\label{fig:loss}         % 定义标签
图~\ref{fig:loss}        % 引用图
表~\ref{tab:result}      % 引用表
公式~\ref{equ:forward}   % 引用公式
第~\ref{ch:intro} 章     % 引用章节
```

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

字体从项目本地 `fonts/` 目录加载，换电脑无需重新安装字体。

## 项目结构

```
├── main.tex              主文件（控制文档结构）
├── thuthesis.cls         文档类（格式定义，一般不需修改）
├── thuthesis.cfg         配置文件（定理、章节名等）
├── thuthesis.sty         额外宏包加载
├── .gitignore            Git 忽略规则
├── fonts/                字体目录（随项目分发）
├── data/                 内容文件
│   ├── cover.tex         封面信息 + 中英文摘要
│   ├── chap01.tex        第一章
│   ├── chap02.tex        第二章（按需添加更多）
│   ├── conclusion.tex    总结与展望
│   ├── references.tex    参考文献
│   ├── acknowledgment.tex 致谢
│   ├── denotation.tex    符号对照表
│   ├── abbreviation.tex  缩略词表
│   └── appendixA.tex     附录
├── figures/              图片目录（PDF/PNG/JPG）
└── ref/                  BibTeX 数据库（可选）
```

## 文档结构顺序（研究生）

封面 → 第二封面 → 英文封面 → 原创性声明 → 目录 → 摘要 → 插图索引 → 表格索引 → 算法索引 → 符号对照表 → 缩略词表 → 正文 → 总结与展望 → 参考文献 → 致谢 → 附录

## 常见问题

**Q: 编译报错 `fontspec` 找不到字体？**

确保使用 `xelatex` 而非 `pdflatex` 编译。模板字体从本地 `fonts/` 加载，不依赖系统字体。

**Q: 交叉引用显示 `??`？**

编译两遍即可解决。第一遍生成标签，第二遍解析引用。

**Q: 如何添加新章节？**

在 `data/` 下新建 `chapXX.tex`，然后在 `main.tex` 的 `\mainmatter` 部分添加 `\include{data/chapXX}`。

**Q: 图片格式推荐？**

矢量图（流程图、架构图）导出为 PDF；截图、照片用 PNG。JPG 适合照片但有损压缩。

**Q: 硕士和博士有什么区别？**

在 `data/cover.tex` 中设置 `cdegree={博士}` 和 `edegree={Doctor of Philosophy}`，其余格式自动适配。

## 清理中间文件

```bash
rm -f main.aux main.log main.out main.toc main.lof main.lot main.loa main.bbl main.blg main.synctex.gz main.thm main.fls main.fdb_latexmk
```

## 致谢

本模板基于清华大学 ThuThesis 模板修改，感谢原作者的贡献。
