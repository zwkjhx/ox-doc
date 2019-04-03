# 模板和页面连接文件

Zero UI中会通过目录来生成固定的路由，并且注入到`react-router`中去，形成固定路由处理。

## 1. 举例

比如现在有一个浏览器中打开的地址：[http://localhost:5000/ox/login/index](http://localhost:5000/ox/login/index)，在Zero中这个URL地址具有不同的意义。

| 项目 | 说明 |
| :--- | :--- |
| localhost | HOST环境变量配置，主机地址 |
| 5000 | PORT环境变量配置，当前应用端口 |
| ox | Z\_ROUTE环境变量配置，不同的应用使用的环境变量不一样，通过这种方式可支持不同的企业用户使用的根路径不同。 |
| login/index | src/components/login/index/UI.js入口文件渲染出来的页面。 |

## 2. 结构

Zero UI中的前端页面主要包含两部分：

* src/container/login/index/UI.js：当前页面使用的模板文件；
* src/components/login/index/UI.js：当前页面核心文件；

在Zero UI中一个页面主要分为两部分：![](/assets/images/zui/003/tpl.png)实际上模板是多个页面可共享的文件，而页面文件是每个地址独有的文件，通过这种方式就可以将一个完整的应用呈现出来了。

