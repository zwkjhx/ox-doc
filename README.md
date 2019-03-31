# 回到始源之地

我们总是不知道自己要什么，同样，我们也不清楚生活的目标究竟在哪，于是视之为迷茫。很多时候，在前行途中，我们看多了风景，引起了视觉的疲劳，回过头来却忘记了自己的初衷。开设这个项目的目的只是为了搭建自己的知识库，也可以称为个人知识库，从Zero（[http://www.vertxup.cn](http://www.vertxup.cn)）到Zero UI（[http://www.vertxui.cn](http://www.vertxui.cn)）开源也快有一年的时间了，各种文档错综复杂，少了脉络，使得读者略显疲乏，于是重新整理一份完整的知识库，系统通过整理，将真正有价值的东西呈现出来。

## 1. 环境准备

Origin X Doc是为Origin X Engine量身打造的文档型项目，使用`gitbook`可直接本地化成电子书方便查阅，不仅仅如此，本文档中收录了更多在开发过程中的心得以及环境搭建过程中遇到的种种问题，希望真正对读者有所帮助。

### 1.1. 本地化

在自己的本机使用下边命令安装一个静态服务器，推荐使用 `serve`

```shell
sudo npm install -g serve
```

然后执行根目录的Shell脚本：

```shell
./book-server.sh
```

用浏览器打开地址：[http://localhost:1231/](http://localhost:1231/)，您就可以访问本地化的 Origin X Doc的主页了。

### 1.2. 在线版

在线的版本发布在新的域名下，这里枚举当前系统关联的所有在线地址：

| 地址 | 说明 |
| :--- | :--- |
| [http://www.vertxup.cn](http://www.vertxup.cn) | 「后端」Zero框架主页 |
| [http://www.vertxui.cn](http://www.vertxui.cn) | 「前端」Zero UI框架主页 |
| [http://www.origin-x.cn](http://www.origin-x.cn) | 「当前」Origin X Doc项目主页 |

## 2. 文档说明

### 2.1. 前缀说明

前缀说明一直是我在写文档过程中的一个习惯（不谈好坏），通过前缀将文档本身进行分类，使得文档标题具有更明确的类型指向，而不是任何时候都需要通过类型树来对文档进行定位。





