# Origin X UI项目结构说明

Origin X是建立在Zero UI之上新起的一个前端项目，外层项目结构可以参考：[ZUI-001 Zero UI项目结构说明](/zero-ui/1-zero-uiji-ben-jiao-cheng/zui-001-zero-uixiang-mu-jie-gou-shuo-ming.md)，本文主要解析Origin X中的内层项目结构`src/app`中出现的内容。

## 1. 目录说明

> Origin X UI运行在Zero UI之上，所以整个Origin X UI中的目录结构的根目录以 src/app/ 为主，固定文件：不可以更改文件名和路径，Zero UI需要依靠这些文件做完整的链接，这里需要说明一下：Zero UI中使用了下边的方式来处理Ajax请求：
>
> * 使用`Ux.createAction`的API创建Types定义类型，内置使用了redux-act。
> * 使用`Ux.ajaxXXX`系列的API创建对应的Ajax Promise，这一系列的API主要包含三种：带Token请求、不带Token请求、上传下载，调用这一系列的请求时候会直接使用mock中的模拟数据实现前端独立开发。
> * 统一使用`Ux.rxXXX`系列的API创建Epic，内部使用了Rxjs中的API执行响应式处理。

| 目录 / 子目录 | 特殊文件 | 说明 |
| :--- | :--- | :--- |
| action | Ajax.js | 固定文件，Ajax远程访问主文件 |
| action | Epic.js | 固定文件，Epic远程访问主文件 |
| action | Types.js | 固定文件，Redux中的Types定义文件 |
| action/dashboard |  | 首页专用Ajax |
| action/datum |  | 系统数据文件，如X\_CATEGORY，X\_TABULAR等 |
| action/graphic |  | 图引擎专用文件 |
| action/macrocosm |  | 系统数据，如X\_APP，X\_SOURCE等 |
| action/security |  | 权限控制专用文件 |
| action/web |  | Web UI的配置程序读取专用文件 |
| action/mock |  | 模拟数据专用文件夹 |
| action/mock/web |  | 【开发】页面Mock文件 |
| action/mock/dynamic |  | 【开发】业务数据Mock专用文件 |
| function |  | Origin X通用工具函数库 |
| function/behavior |  | Origin X中的DataEvent事件底层专用事件Action列表 |
| function/common |  | Origin X中的核心共享函数 |
| function/event |  | Origin X中的DataEvent事件处理核心组件 |
| function/render |  | Origin X中的页面动态渲染组件 |
| hoc | Ox.js | @ox注解的内部逻辑，高阶抽象组件专用文件，High Order Component |
| web |  | Origin X中的自定义组件 |
| web/action |  | 事件类 |
| web/component |  | 组件类 |
| web/container |  | 容器类 |
| web/element |  | 元素类 |
| web/engine |  | Origin X引擎特殊定制 |
| web/graphic |  | 图类 |
| web/sider |  | 左侧菜单类 |

> 关于自定义组件的清单可以参考：[OXC-001 关于自定义组件](/origin-x-engine/2-oxzi-ding-yi-zu-jian/oxc-001-guan-yu-zi-ding-yi-zu-jian.md)

## 2. Origin X UI中的核心

这里提供Origin X UI和Zero UI的对比表如下：

| 项 | Zero UI | Origin X UI |
| :--- | :--- | :--- |
| 支持动态路由 | 不支持 | 支持 |
| 界面渲染语言 | React Jsx | Json数据文件 |
| 高阶专用注解 | @zero | @ox |
| 启用entity中的DataEvent | 不使用 | 启用 |
| 单项数据流组件 | Redux | React State |
| Ajax请求 | 仅业务请求 | 配置请求和业务请求 |
| 面向用户群主体 | 开发人员 | 实施人员 |
| 依赖固定后端 | 不依赖，纯前端框架 | 依赖后端的Origin X Engine |

实际上Origin X UI不能算是Zero UI的升级版，毕竟使用的用户群体不一样，在Origin X UI中，用户可以直接通过界面工具入口直接对整个系统的页面进行全新创建，创建过程直接使用：

* Form Designer可视化设计表单
* Page Designer动态创建新的页面
* Model Designer进行建模设计
* Flow Designer进行工作流设计
* Report Designer进行报表设计和定义
* Integration Designer进行集成管理，包括接口定义、业务组件植入

以上列表是Origin X UI中最终会提供的工具类，主要提供给实施人员直接在系统中执行二次开发和定制动作。



