# 界面配置全Json解析

本文用于定义Origin X中的配置规范，使用更加合理的方式来组织所有的配置信息，并描述各个不同的数据结构，统一完整规范。

## 1. 整体结构

一份完整的界面数据的结构参考：[SPO-002 界面配置全Json示例](/specification/3-origin-xgui-fan/spo-002-jie-mian-pei-zhi-quan-json-shi-li.md)，整个配置数据的结构如下：

```json
{
    "mock":true,
    "data":{
        "layout":{
        },
        "ajax":{
        },
        "page":{
        },
        "control":{
        }
    }
}
```

上述配置结构的顶层是Zero UI中的Mock结构，这里不做说明，主要集中于分析`data`数据节点的内容。

* **layout**：「保留」由于目前的项目中动态渲染（Ox模式）和静态渲染（Zero模式）使用了同一个模板，所以暂时对模板部分的配置保留。
* **ajax**：当前页面需要使用的所有 Ajax 请求数据。
* **page**：当前页面的根节点，根节点主要包含两部分内容：
  * 当前页面的整体布局，整体布局使用内部的layout来描述，后边会有所说明。
  * 当前页面的外置容器（即顶层容器）——对于页面顶层容器，Ox中只支持单元素容器，即children = 1的容器，其他的容器无法作为顶层容器使用，容器位于：`src/app/web/container`目录中定义的容器组件。
* **control**：页面中某个区域的Web控件节点，该Web控件一般包含两部分内容：container和component。
  * **container**：当前控件需要使用的容器类，可支持 children  &gt; 1的情况，如标签容器，左右分割容器等。
  * **component**：当前控件的核心组件——特殊情况下核心组件也可以是一个容器，这种用于深层嵌套结构。



