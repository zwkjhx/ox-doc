# 查询参数criteria配置解析

## 1. criteria配置

在`Zero / Zero UI / Origin X`中有一种特殊的查询请求：POST查询，并且该查询主要包含了特殊参数：

```json
{
    "criteria":{
    },
    "pager":{
        "page":1,
        "size":10
    },
    "sorter":[
        "name,DESC"
    ],
    "projection":[
    ]
}
```

那么不论是Zero UI还是Origin X，都需要将查询部分配置的`criteria`的数据解析出来才可以真正投入到实战中，关于查询引擎部分的语法可以参考：[KMZ-001 查询引擎语法](/uniform-documentation/zerohe-xin-li-lun/kmz-001-cha-xun-yin-qing-yu-fa.md)。

### 示例：

比如现在有一个请求的URI如：`/app/:appId/menus`，那么这个时候的`appId`应该如何配置呢？你当然会说，直接在代码里写！——我承认这是一个不错的解决方案，但是别忘了Origin X是数据驱动的，Zero UI是配置驱动的，也就是说如果使用了硬编码，而不是配置/数据层面的方式，



