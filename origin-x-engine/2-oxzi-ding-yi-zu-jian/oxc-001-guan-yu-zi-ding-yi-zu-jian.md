# 自定义组件

自定义组件是整个Origin X渲染界面的核心，在后端它直接和`UI_CONTROL`进行关联，用来描述界面中不同的组件类型，并且进行统一化的管理以及事件化管理，本文对自定义组件进行详细介绍，主要提供给Ox的研发人员使用。

## 1. 基本规范

Ox自定义组件的存储位置位于：`src/app/web/`目录中，基本遵循下边的规则：

* 所有Ox的组件都是以`Ox`命名起头；
* 所有Ox的行为组件（带`event`事件配置的）都是以`OxAct`命名起头；
* Ox组件的名称用`UI.js`，风格文件名称遵循Zero UI使用`Cab.less、Cab.Fit.less`；
* 生命周期文件：`componentDidMount`和`componentDidUpdate`统一使用`Life.js`文件来处理，并且方法名统一；

* 


