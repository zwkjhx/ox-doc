# 页面结构说明

## 1. 基本

页面结构说明主要位于基本节点`page`下，它的格式如下：

```json
{
    "page":{
        "layout":[]
        "container":{}
    }
}
```

| 节点 | 含义 |
| :--- | :--- |
| layout | 描述当前页面的布局信息 |
| container | 顶层页面容器 |

在Origin X Engine中，一个页面对应后端的`UI_PAGE`表，里面会存储当前页面的所有配置信息，页面本身包含两部分配置内容：布局和容器，页面布局的信息可参考：[SPO-004 页面布局说明](/specification/3-origin-xgui-fan/spo-004-ye-mian-bu-ju-shuo-ming.md)。

## 2. 限制



