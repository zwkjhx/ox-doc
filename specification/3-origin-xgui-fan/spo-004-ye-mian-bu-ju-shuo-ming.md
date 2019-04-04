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

