# Control的基本结构

## 1. 和布局连接

前文中已经讲解了Origin X Engine中的`page`和`ajax`两部分内容，本文主要针对`control`节点进行说明，在章节《[SPO-004 页面布局说明](/specification/3-origin-xgui-fan/spo-004-ye-mian-bu-ju-shuo-ming.md)》中，我们看到了下边的布局信息：

```json
{
    "page":{
        "layout":[
            "2ba7d8a5-c840-4bdf-9449-72c1407c5262",
            [
                {
                    "span":8,
                    "value":[
                        "6066a32c-d0b4-4243-8e21-b495cf49b1d4"
                    ]
                },
                {
                    "span":16,
                    "value":[
                        "b2fbb200-0371-4ca0-a174-080562613087"
                    ]
                }
            ]
        ]
    }
}
```

上边的UUID代表什么呢？实际上在对应的配置中如果出现了上述的节点，那么需要配置另外的节点，就是`control`，配置的内容如下：

```json
{
    "control":{
        "2ba7d8a5-c840-4bdf-9449-72c1407c5262":{},
        "6066a32c-d0b4-4243-8e21-b495cf49b1d4":{},
        "b2fbb200-0371-4ca0-a174-080562613087":{}
    }
}
```



