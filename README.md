## NVIM

安装 `pynvim`(pip)

安装`nodejs` `npm install -g neovim`


执行 `:checkhealth`

Python 程序调试 (通过 `vimspector` 实现)

安装 `debugpy` (使用 `pip`)

配置 `Python` 路径

-  确保你安装了 Python

标签表

-  安装 `ctags` 以获得类/函数/变量的三重支持

FZF

-  安装 `fzf`
-  安装 `ag` (`the_silver_searcher` 需要)

其它...

-  安装 `figlet` 以输入 ASCII 艺术字
-  安装 `xclip` 以获得系统剪切板访问支持 (仅 `Linux` 与 `xorg` 需要)



## Ranger

使用 `pip install ueberzug` 和 `ranger-git`



## 字体

 `Source Code Pro` 字体和 `nerd-fonts-source-code-pro`

#### 关于 Noto

只需要安装 `noto-fonts` (并非 `-all`), 它已经非常臃肿, 检查 `/usr/share/fonts/noto`

#### Emoji

```
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```

#### 中文

```
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```



| 大类     | 小类       | 软件             | 备注                         |
| ------- | ---------- | --------   | ---------------------------- |
| 系统功能 | 窗口管理器 | dwm                   |                              |
|          | 联网管理   | nm-applet            | NetworkManager 的托盘程序    |
|          | 音量调节   | pavucontrol          |                              |
|          |            | pamixer              | 快捷键调节                   |
|          | 亮度调节   | xbacklight           | Polybar 模块依赖             |
|          |            | light                | 快捷键调节                   |
|          | 输入法     | Fcitx                | + Rime + Material-theme      |
|          | 状态栏     | polybar              |                              |
|          | 壁纸设置   | feh                  |                              |
|          | 触摸板     | Libinput-gestures    |                              |
|          | 色温调节   | redshift             |                              |
|          | 主题管理   | lxappearance         |                              |
|          |            | qt5ct                | + kvantum                    |
|          | 混成器     | compton              |                              |
| 基础软件 | 终端       | termite              |                              |
|          |            | xfce4-terminal       | 备用，可能只是配合 Thunar    |
|          | 文件管理器 | thunar               |                              |
|          |            | ranger               |                              |
|          | 浏览器     | Firefox              | 太喜欢树状标签栏             |
|          |            | Google-chrome-stable | 备用                         |
|          | 编辑器     | Emacs                | 因为 Org-mode 入坑           |
|          |            | vim                  | 用来写 Emacs 配置 （peace    |
|          | 图片浏览   | Viewnior             | 参考了 Manjaro i3 的预装软件 |
|          | 视频播放   | mpv                  | 发热严重                     |
|          | 压缩文件   | file-roller          | Gnome 全家桶                 |
|          | 音乐播放   | mpd                  | + ncmpcpp                    |
|          |            | audacious            | 备用                         |
| 文档     | PDF 浏览   | zathura              |                              |
|          | Office 类  | Wps                  |                              |
|          | 其他       | Org-mode             |                              |
| 其他     | 字体字符   | gucharmap            | 浏览字体有哪些字符           |
|          | 密码管理   | keepassxc            |                              |
|          | 截图       | flameshot            |                              |
|          | 屏幕取色   | Gpick                |                              |
|          | 漫画阅读   | MComix               |                              |
|          | 词典       | SDCV                 | 星际词典 - 命令行版本，配合  |
|          |            |                      | 词典和通知做取词翻译         |

