# Zero框架内部组件说明

Zero框架中使用了很多后缀命名法用于定义不同的组件，本文主要讲解某些后缀下的不同组件对应的职责以及含义，方便开发者阅读Zero本身的代码。

## 1. 启动组件

| 组件 | 详细说明 |
| :--- | :--- |
| VertxApplication / DansApplication | 标准服务启动器 / ApiGateway启动器。 |
| Scatter | 启动器子线程，包含：Agent扫描线程、Worker扫描线程、Infix插件扫描线程、Rule规则扫描线程四种。 |
| Visitor | 配置访问器，分两种：纯数据系列如读取JsonObject/JsonArray；特殊DTO系列，如Vert.x Options，Server Options等。 |
| Node&lt;T&gt; | 配置数据解析器，主要分： |
|  |  |
|  |  |
|  |  |
|  |  |



