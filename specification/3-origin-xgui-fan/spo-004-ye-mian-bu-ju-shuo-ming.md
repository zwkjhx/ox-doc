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

在`Ant Design`中，



