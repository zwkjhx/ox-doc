# 界面配置全Json解析

本文用于定义Origin X中的配置规范，使用更加合理的方式来组织所有的配置信息，并描述各个不同的数据结构，统一完整规范。

## 1. 整体结构

### 1.1. 示例说明

一份完整的界面数据的结构参考：[SPO-002 界面配置全Json示例](/specification/3-origin-xgui-fan/spo-002-jie-mian-pei-zhi-quan-json-shi-li.md)。

```json
{
    "mock":true,
    "data":{
        "layout":{}
        "ajax":{
            "ajaxKey":{
                "uri":"访问地址专用的Uri",
                "method":"Http方法",
                "query":{
                    "projection":""
                }
            }
        }
    }
}
```

顶层是Zero UI中本身存在的**模拟数据**规范，所以这里不做说明，直接针对data节点进行解析。

