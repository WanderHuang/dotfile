## 安装`doom-emacs`

> 环境：macos intel
> 需要提前安装`doom-emacs`依赖，比如`ripgrep`(`rust`写的模糊搜索引擎)
>
> 安装过程比较长，需要几分钟～十几分钟


1. 参考[官方教程](https://github.com/hlissner/doom-emacs/blob/master/docs/getting_started.org#on-macos)安装第一个选项`emacs-mac`: 这一步安装好你的`emacs`，这一步安装好后`TUI`和`GUI`都有了
2. 安装`doom-emacs`: 使用[官方教程](https://github.com/hlissner/doom-emacs#install)就可以了
3. [OPTION] 熟悉`doom`命令，把`doom`命令添加到`PATH`中
4. 修改`~/.doom.d/init.el`中的配置，把需要的`layer`(类似于`vim`中的插件) 的注释去掉，比如`treemacs`
5. 运行`doom sync`更新基础配置
6. 在启动栏中选择`emacs`的`GUI`应用打开
7. [OPTION] `emacs`如果是在其他终端打开的，比如`iterm2`，可能需要修改终端配置，把`OPTION`键设置为`META`。`doom-emacs`默认使用`OPTION`为`META`键


## 基本操作

- `SPC p a` 添加`project`，可以理解为`vscode`中的应用目录，后面就可以直接在应用中打开该目录
- `SPC p p` 切换到对应的`project`，这里可以选择任意文件，使用`RET`打开
- `SPC o p` 打开`project`对应的文件目录，此功能依赖于`treemacs`，需要在`init.el`中安装好
- `SPC /` 搜索`project`的文件，模糊搜索

其他操作都是和`NVIM`一致的。比如：

- `gd` 跳转定义
- `C-o` 跳回上一个光标所在位置
- `K` 显示函数定义，依赖于`lsp`功能，需要在`init.el`中安装`lsp`

