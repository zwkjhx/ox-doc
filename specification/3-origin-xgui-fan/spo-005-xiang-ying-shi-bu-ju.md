## 响应式布局

[SPO-004 页面布局说明](/specification/3-origin-xgui-fan/spo-004-ye-mian-bu-ju-shuo-ming.md)中提到的一个页面的片段如：

```json
{
    "span":16,
    "value":[
        "ee61e2d9-93e4-4478-971d-36e24f59723e",
        "a4031496-6460-4464-9d6f-e1fb20cd16d3"
    ]
}
```

Origin X中的响应式布局直接沿用Ant Design中的响应式处理：[https://ant.design/components/grid-cn/\#components-grid-demo-responsive](https://ant.design/components/grid-cn/#components-grid-demo-responsive)，通过对`<Col/>`进行特殊的响应式配置来实现响应式布局。

## 1. 响应式

| 属性名 | 说明 |
| :--- | :--- |
|  |  |

## 2. 响应式配置

下边是响应式布局的示例：

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



