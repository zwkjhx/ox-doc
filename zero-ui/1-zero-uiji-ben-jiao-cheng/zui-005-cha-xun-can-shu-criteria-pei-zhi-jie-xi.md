# 查询参数criteria配置解析

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

那么不论是Zero UI还是Origin X，都需要将查询部分`criteria`的数据解析出来才可以真正投入到实战中，关于查询引擎部分的语法可以参考：[KMZ-001 查询引擎语法](/uniform-documentation/zerohe-xin-li-lun/kmz-001-cha-xun-yin-qing-yu-fa.md)。

