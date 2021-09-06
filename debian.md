## wsl: Debian环境配置（前端开发 & rust开发）

### 基础设施

```sh
sudo apt-get update
sudo apt-get install curl
sudo apt-get install net-tools
sudo apt-get install nodejs
sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install tmux
```

### 终端

注意：终端显示的字体和色彩需要在对应的平台安装。比如`windows 10`的就需要在windows内安装字体。

```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
sudo ./oh-my-zsh-powerline-theme/install.sh 
```

终端使用`windows terminal`，使用`windows terminal -> 设置`修改配置

### 编辑器

`vim`
