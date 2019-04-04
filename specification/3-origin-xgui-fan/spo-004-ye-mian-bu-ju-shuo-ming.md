# 页面布局说明

## 1. 基本

页面配置中有一个特殊节点`layout`，如：

```json
{
    "page":{
        "layout":[],
        "container":{}
    }
}
```

上边的配置片段中，`layout`用于描述当前页面的布局信息，Origin X是运行在Zero UI之上的动态页面渲染模式，而底层的页面布局使用了`Ant Design`中的Grid布局，所以对于`layout`本文会详细解析它的完整结构。

## 2. 关于Grid

在`Ant Design`中（[https://ant.design/components/grid-cn/](https://ant.design/components/grid-cn/)）它的Grid布局将整个页面分成了24列，在不考虑响应式处理的情况下，直接使用`<Col>`标签的`span`属性进行设置，那么Origin X基于这点通过二维数组的模式来进行布局。

### 2.1. 行配置

参考下边一段配置（UUID部分会放上一个最终的Control控件）：

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

Origin X中的行配置格式有两种：

* 直接使用字符串格式，一个UUID标识这个位置需要放上一个Control，这种情况下表示这个Control会满行（span=24）。
* 使用数组的格式，这种格式下这一行可能会包含多个列，每一个列用一个Object来描述。

那么上边的配置可以用下边这个图来表示：

### 2.2. 列配置

在Origin X的某一个行中，除非是满行（span=24）的情况，否则这个页面就可能存在多个列，每个列包含两个属性：

* span：表示当前列占据的比例（同一行中所有列的和为24），例子中的第一列占了1/3（span=8）。
* value：一个数组，表示当前列中又可以支持多少行，实际上列中的value会和layout的格式一样，执行“**递归**”。

## 3. 渲染顺序

实际上，Origin X中的Grid渲染顺序如下：

1. 渲染起点：查找`layout`节点，执行行渲染：`<Row/>`。
2. 


