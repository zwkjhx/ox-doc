# Origin X UI项目结构说明

Origin X是建立在Zero UI之上新起的一个前端项目，外层项目结构可以参考：[ZUI-001 Zero UI项目结构说明](/zero-ui/1-zero-uiji-ben-jiao-cheng/zui-001-zero-uixiang-mu-jie-gou-shuo-ming.md)，本文主要解析Origin X中的内层项目结构`src/app`中出现的内容。

## 1. 目录说明

> Origin X运行在Zero UI之上，所以整个Origin X中的目录结构的根目录以 src/app/ 为主，固定文件：不可以更改文件名和路径，Zero UI需要依靠这些文件做完整的链接，这里需要说明一下：Zero UI中使用了下边的方式来处理Ajax请求：

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
| action/mock/web |  | 【开发】页面Mock文件 |
| action/mock/dynamic |  | 【开发】业务数据Mock专用文件 |



