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

