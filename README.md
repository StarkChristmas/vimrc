# Vimrc
![](screenshots/3.gif)

## 一键安装
```
bash <(curl https://github.com/StarkChristmas/vimrc/raw/master/autoinstall.sh -L)
```

## 如何使用

1. 启动 Vim 后运行：

```vim
:PluginInstall
```

2. 若更新 `.vimrc`，直接保存即可触发：

```vim
autocmd! bufwritepost .vimrc source %
```

---

如需扩展支持（如 YARA 分析、C2 通信检测、日志可视化等），可进一步集成插件和 Python 工具。


## 添加MarkdownPreview
```
sudo npm -g install instant-markdown-d
```
## 快捷键
```
\cc 注释光标所在行
\ci 切换突出显示的行的状态
\cu 取消注释光标突出显示的行
\cs 使用/ *和* /而不是普通的//注释突出显示的内容
```
## 配置文件核心特性

- 使用 Vundle 管理插件
- 默认启用 UTF-8 编码
- 自动重载 `.vimrc` 文件修改
- 支持多语言开发（Go, Python, Bash 等）
- 适用于日志分析、恶意样本审查、代码开发、Git 工作流等

## 支持开发语言：
```
C
C++
Python
Bash
Goalng
```
## 编码与行为设置

### 字符编码相关：

- `set encoding=utf-8`

### 其他设置示例：

- 启用插件路径：`set rtp+=~/.vim/bundle/Vundle.vim`
- 使用增强兼容模式：`set nocompatible`
- 设置终端编码：`set termencoding=utf-8`


## 自动命令（autocmd）

以下自动命令增强了用户体验和可维护性：

- `autocmd! bufwritepost .vimrc source %`
- `autocmd BufReadPost,BufNewFile * if &modifiable | setlocal fileencoding=utf-8 | endif`
- `autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black`
- `autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black`
- `autocmd VimEnter * :IndentGuidesEnable`
- `autocmd VimEnter * call AirlineInit()`
- `autocmd vimenter * NERDTree`
- `autocmd StdinReadPre * let s:std_in=1`
- `autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif`
- `autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")`
- `autocmd BufNewFile,BufReadPost *.md set filetype=markdown    " *.md support`
- `autocmd VimEnter,BufReadPost,bufwritepost,bufenter * :FixWhitespace`

---

## 使用场景建议

### 恶意样本分析
- 使用 `hexmode` 或 `pfp-vim` 插件查看二进制结构
- 结合 `Align`、`surround` 处理嵌套结构、编码数据

### Web / 系统日志处理
- 快捷查找异常关键字
- 自动折叠/高亮日志结构
- 与 `vim-trailing-whitespace` 协同清理日志冗余字符

### 安全开发支持
- 自动格式化：`vim-autoformat`
- Python 缩进 PEP8 校验：`vim-python-pep8-indent`
- Git 变更提示：`vim-gitgutter`
- 多文件导航与模糊搜索：`ctrlp.vim`

---

## 插件详细功能说明

### `Chiel92/vim-autoformat`
- **功能**：代码格式化工具
- **用途**：通过 `:Autoformat` 命令支持多语言自动格式化。
### `MatlabFilesEdition`
- **功能**：Matlab 文件增强
- **用途**：为 Matlab 文件提供语法高亮和编辑优化功能。
### `RRethy/vim-illuminate`
- **功能**：符号高亮
- **用途**：自动高亮当前光标下符号的所有引用。
### `Raimondi/delimitMate`
- **功能**：括号补全
- **用途**：自动补全括号、引号等符号，提高编辑效率。
### `Vimjas/vim-python-pep8-indent`
- **功能**：Python 缩进
- **用途**：按 PEP8 标准自动缩进 Python 代码。
### `airblade/vim-gitgutter`
- **功能**：Git 差异提示
- **用途**：在行号边栏显示 Git 变更 (+/-)，支持 diff 和跳转。
### `bling/vim-airline`
- **功能**：状态栏美化
- **用途**：美化底部状态栏，显示模式、文件状态等信息。
### `bronson/vim-trailing-whitespace`
- **功能**：尾部空格清理
- **用途**：高亮并清除每行末尾多余空格。
### `ctrlpvim/ctrlp.vim`
- **功能**：模糊查找
- **用途**：模糊匹配文件名、buffer、MRU，快速导航项目文件。
### `d0c-s4vage/pfp-vim`
- **功能**：二进制结构解析
- **用途**：结合 `pfp` 库可视化分析二进制结构，适合样本分析。
### `dense-analysis/ale`
- **功能**：异步语法检查
- **用途**：实时 lint 检查和修复，支持多语言。
### `edkolev/promptline.vim`
- **功能**：终端提示符定制
- **用途**：用于生成个性化 Shell Prompt 样式。
### `ervandew/supertab`
- **功能**：Tab 补全增强
- **用途**：在插入模式下使用 Tab 自动补全关键字。
### `fatih/vim-go`
- **功能**：Golang 开发支持
- **用途**：提供格式化、跳转、测试、构建等 Go 开发能力。
### `fidian/hexmode`
- **功能**：十六进制编辑
- **用途**：在 Vim 中以 hex 形式查看和编辑二进制文件。
### `gmarik/Vundle.vim`
- **功能**：插件管理器
- **用途**：核心插件管理工具，支持插件声明、安装、更新。
### `godlygeek/tabular`
- **功能**：文本对齐
- **用途**：用于按 `=`、`:` 等符号对齐配置或代码。
### `jiangmiao/auto-pairs`
- **功能**：自动括号配对
- **用途**：在输入括号/引号时自动补全闭合符号。
### `jistr/vim-nerdtree-tabs`
- **功能**：NERDTree 标签页支持
- **用途**：使 NERDTree 支持多标签页面独立浏览。
### `junegunn/fzf`
- **功能**：通用模糊查找引擎
- **用途**：配合 fzf.vim 提供高性能模糊搜索。
### `junegunn/fzf.vim`
- **功能**：fzf 集成
- **用途**：将 fzf 功能整合进 Vim，提供 `:Files`, `:Rg` 等命令。
### `junegunn/vim-easy-align`
- **功能**：快捷对齐插件
- **用途**：通过快捷键快速对齐变量、配置等结构。
### `kien/rainbow_parentheses.vim`
- **功能**：括号嵌套高亮
- **用途**：为括号嵌套提供颜色分层高亮，易于辨析结构。
### `luochen1990/rainbow`
- **功能**：增强型括号着色
- **用途**：支持多种语言括号着色，适用于结构复杂代码。
### `nathanaelkane/vim-indent-guides`
- **功能**：缩进可视化
- **用途**：显示缩进层级结构，提升代码阅读体验。
### `neoclide/coc.nvim`
- **功能**：LSP+补全引擎
- **用途**：基于 Node.js 的智能补全框架，支持多语言 LSP。
### `preservim/tagbar`
- **功能**：标签视图
- **用途**：以侧边栏形式展示函数、变量等标签结构。
### `puremourning/vimspector`
- **功能**：多语言调试器
- **用途**：在 Vim 中使用图形化 UI 进行调试。
### `s3rvac/vim-syntax-yara`
- **功能**：YARA 高亮支持
- **用途**：提供 `.yara` 文件语法高亮与结构化审查。
### `scrooloose/nerdcommenter`
- **功能**：代码注释工具
- **用途**：快速为多语言代码添加/取消注释。
### `scrooloose/nerdtree`
- **功能**：目录浏览器
- **用途**：以树形方式浏览项目目录，支持快捷操作。
### `scrooloose/syntastic`
- **功能**：语法检查器
- **用途**：支持多语言语法分析，提示错误和警告信息。
### `sheerun/vim-polyglot`
- **功能**：多语言支持集合
- **用途**：自动加载多种语言语法/缩进插件。
### `suan/vim-instant-markdown`
- **功能**：Markdown 实时预览
- **用途**：在浏览器中实时预览当前 Markdown 内容。
### `tomasr/molokai`
- **功能**：Molokai 主题
- **用途**：受 TextMate 启发的流行 Vim 配色主题。
### `tpope/vim-fugitive`
- **功能**：Git 工具集
- **用途**：Git 在 Vim 中的终极接口，支持状态、提交、diff 等。
### `tpope/vim-markdown`
- **功能**：Markdown 编辑增强
- **用途**：提供 Markdown 文件语法高亮与缩进支持。
### `tpope/vim-surround`
- **功能**：文本结构操作
- **用途**：轻松添加/修改/删除配对符（如括号/引号）。
### `vim-python/python-syntax`
- **功能**：Python 语法增强
- **用途**：提供更准确全面的 Python 语法高亮。
### `vim-scripts/Align`
- **功能**：对齐插件
- **用途**：支持多个符号对齐操作，适用于配置/日志结构。
### `voldikss/vim-floaterm`
- **功能**：浮动终端
- **用途**：在 Vim 中嵌入终端，支持多标签与切换。

### Screenshot

![](screenshots/1.png)
![](screenshots/2.png)
