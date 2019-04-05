# 全局覆盖性变量

全局覆盖性变量主要用于穿透整个Control的树形结构，使得特殊的数据可以直接传入到不同的组件中执行分发，并且这些变量有别于Zero UI中本身存在的变量信息。

## 1. 变量说明

| 变量名称.属性名 | 说明 |
| :--- | :--- |
| $metadata.control | 当前配置中的control节点，处理DataEvent构造target事件目标专用。 |
| $metadata.ajax | 当前配置中的ajax节点，Lazy模式下构造Promise专用。 |
| $container | 顶层父组件引用，所有的组件能够拿到的$container都是顶层引用。 |
|  |  |



