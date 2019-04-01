# 开发Zero UI的第一个页面

本文是一个类似`Hello World`的例子，这个例子会告诉开发人员一步一步去开发一个Zero UI中的页面需要怎么办。

## 基本概念

一个Zero UI的页面主要包含下边几部分：

> `<m>`表示模块名字，`<p>`表示页面名字，比如开发用户管理可以直接设置成：src/container/user/manage和src/components/user/manage，这样就可以通过：[http://&lt;host&gt;:&lt;port&gt;/&lt;Z\_ROUTE&gt;/user/manage ](http://<host>:<port>/<Z_ROUTE>/user/manage )的地址访问了。
>
> * host：服务器的主机名
> * port：服务器端口，可通过PORT环境变量配置
> * Z\_ROUTE：环境变量设置的当前应用的根路径

| 路径 | 文件名 | 说明 |
| :--- | :--- | :--- |
| src/container/&lt;m&gt;/&lt;p&gt; | UI.js | 每一个模板的入口页 |
|  | Cab.less | 模板风格文件 |
| src/components/&lt;m&gt;/&lt;p&gt; | UI.js | 每一个页面的入口页 |
|  | Cab.less | 页面风格文件 |
| src/cab/cn/components/&lt;m&gt;/&lt;p&gt; | UI.json | 资源文件 |

有些内容可能对读者比较陌生，不过后边会有相关说明，因此，我们就直接来`Hello World`一把。

示例中的默认信息：

| 环境变量 | 值 |
| :--- | :--- |
| Z\_ROUTE | ima |
| Z\_LANGUAGE | cn |
| Z\_CSS\_PREFIX | ima |

## 1. 开发模板



