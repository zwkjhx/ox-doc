# 自定义组件

自定义组件是整个Origin X渲染界面的核心，在后端它直接和`UI_CONTROL`进行关联，用来描述界面中不同的组件类型，并且进行统一化的管理以及事件化管理，本文对自定义组件进行详细介绍，主要提供给Ox的研发人员使用。

## 1. 基本规范

Ox自定义组件的存储位置位于：`src/app/web/`目录中，基本遵循下边的规则：

* 所有Ox的组件都是以`Ox`命名起头。
* 所有Ox的行为组件（带`event`事件配置的）都是以`OxAct`命名起头。
* Ox组件的名称用`UI.js`，风格文件名称遵循Zero UI使用`Cab.less、Cab.Fit.less`。
* 生命周期文件：`componentDidMount`和`componentDidUpdate`统一使用`Life.js`文件来处理，并且方法名统一。
* 其他的内容都可以随意处理。

## 2. 组件列表

目前系统中存在的组件列表如下：

| 分类 | 名称 | 说明 |
| :--- | :--- | :--- |
| 容器类 | OxAssist | 辅助数据空容器，生成$a\_module\_data的DataArray/DataObject专用容器。 |
|  | OxBoundary | 纯div容器，用于放置内部组件。 |
|  | OxCard | Ant Design中的Card卡片容器。 |
|  | OxContainer | Ox中的标准Grid容器，支持Grid布局模式。 |
|  | OxDivide | 左右分区容器，使用Ant Design中的Row和Col进行左右分区处理。 |
|  | OxTabContainer | Ant Design中的Tabs容器。 |
| 左侧类（菜单、树形） | OxUser | 呈现用户信息的Card卡片。 |
|  | OxCategory | 和后端X\_CATEGORY表执行深度绑定，主管整个系统的类型树。 |
|  | OxSider | 左侧布局容器使用的可伸缩树形菜单。 |
| 组件类 | OxBasicList | Ant Design Pro中的基本分页列表。 |
|  | OxCount | Ant Design Pro中的工作量计数器。 |
|  | OxGridCard | 行列式卡片列表。 |
|  | OxGridLink | 行列式带图标链接列表。 |
|  | OxListTask | 工单表格列表，从Ant Design Pro中延生出来用于放置单据。 |
|  | OxTable | 仅带分页的简单表格，不包含其他复杂功能。 |
|  | OxTableFull | 全功能表格：分页、排序、列过滤、列筛选、行操作（添加、删除、查询、修改、搜索）。 |
|  | OxWelcome | 欢迎组件，一般用于首页。 |
| 专用类 | ExColumn | Ox表格列更改专用组件。 |
| 事件类 | OxActButton | 按钮。 |
|  | OxActCard | 带操作按钮的卡片。 |



