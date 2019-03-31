# [http://www.origin-x.cn](http://www.origin-x.cn)回到始源之地

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

在线的版本发布在新的域名下，地址：[http://www.origin-x.cn](http://www.origin-x.cn)，这里枚举当前系统关联的所有在线地址：

| 地址 | 说明 |
| :--- | :--- |
| [http://www.vertxup.cn](http://www.vertxup.cn) | 「后端」Zero框架主页 |
| [http://www.vertxui.cn](http://www.vertxui.cn) | 「前端」Zero UI框架主页 |
| [http://www.vertxai.cn](http://www.vertxai.cn) | 「工具」Zero 自动化工具主页 |
| [http://www.spring-up.cn](http://www.spring-up.cn) | 和Spring的协同工作桥接器主页 |

> 由于文档的工作量巨大，大部分文档都是整理的以前的原创，再加上整个几个项目都是由我一个人主体维护，大家都是采取业余时间在处理整个体系的文档以及开源代码，所以有些文档可能会出现残章以及不全的地方，请读者见谅。

## 2. 文档说明

### 2.1. 前缀说明

前缀说明一直是我在写文档过程中的一个习惯（不谈好坏），通过前缀将文档本身进行分类，使得文档标题具有更明确的类型指向，而不是任何时候都需要通过类型树来对文档进行定位，文档

### 2.2. 文档分类

| 文档前缀 | 分类说明 | 目录主页 |
| :--- | :--- | :--- |
| KM | 通用知识库 | [通用知识库主页](/uniform-documentation/yin-dao-ye.md) |
| EN | 环境搭建相关知识库 | [环境搭建知识库主页](/environment/yin-dao-ye.md) |
| ZRO | Zero相关知识库（后端） | [Zero 文档主页](/zero-up/shou-ye.md) |
| ZUI | Zero UI相关知识库（前端） | [Zero UI文档主页](/zero-ui/shou-ye.md) |
| OX | Origin X Engine知识库 | [Origin X Engine文档主页](/origin-x-engine/yin-dao-ye.md) |
| SPC | 开发规范文档主页 | [开发规范文档主页](/specification/kai-fa-gui-fan-wen-dang-zhu-ye.md) |

## 3. 总结





