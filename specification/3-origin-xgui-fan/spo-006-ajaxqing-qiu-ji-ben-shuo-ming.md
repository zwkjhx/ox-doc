# Ajax请求基本说明

Origin X中的Ajax基本请求主要包含下边的核心概念：

* ajaxKey：和Mock数据直接绑定的一个字符串，通常使用`xxx.yyy.zzz`的格式。
* lazy模式：是否执行延迟加载（不在初始化的时候执行的Ajax）。
* 基本参数：提供请求Api地址、参数、Http方法。

## 1. 为什么需要ajaxKey？

ajaxKey存在的原因如下：

* 一个页面中允许多个Control控件共享某一个Ajax从远程加载的数据。
* 每一个ajaxKey代表一个唯一的数据来源，而且只会在和这个数据来源相关的地方执行一次加载。
* 只有会变化的数据来源可以使用懒加载模式（Lazy模式）。

## 2. 配置示例

下边是一个页面中的Ajax的配置片段：

```json
{
    "ajax": {
        "personal.circle.by.type": {
            "uri": "/api/personal/circle/type"
        },
        "personal.pager.zone": {
            "uri": "/api/personal/circle/search",
            "method": "POST",
            "query": {
                "projection": [],
                "pager": "1,5",
                "sorter": "createdAt=DESC",
                "criteria": {
                }
            }
        }
    }
}
```

在上边的配置片段中，`personal.circle.by.type`和`personal.pager.zone`就是ajaxKey，后续在Control控件中可以使用

```json
{
    "data":"personal.circle.by.type"
}
```

来执行绑定操作，同样可以在事件DataEvent中调用特殊的行为来执行Ajax调用。

## 3. 基本说明



