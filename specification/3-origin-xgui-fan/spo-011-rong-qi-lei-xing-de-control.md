# 容器类型的Control

容器类型的Control定义在：`src/app/web/container`目录中，主要用于在整个Origin X动态页面链中扮演中间连接点的角色，它会对所有它内置的子组件实现属性和数据的完美继承和解析。

## 1. 容器表

目前Origin X中存在的容器组件列表如下：

| 容器名（可配置在container的name中） | 含义 |
| :--- | :--- |
| OxAssist | 辅助数据容器：[SPO-009 Assist辅助数据Ajax](/specification/3-origin-xgui-fan/spo-009-assistfu-zhu-shu-ju-ajax.md) |
| OxBoundary | 纯&lt;div/&gt;容器 |
| OxCard | 对应Ant Design中的Card（带有标准标题文字或者Extra右上角工具栏） |
| OxContainer | 支持Grid布局的虚拟容器，什么都不做，仅把子组件进行像page中的layout一样的Grid编排。[SPO-004 页面布局说明](/specification/3-origin-xgui-fan/spo-004-ye-mian-bu-ju-shuo-ming.md) |
| OxDivide | 专用左右布局容器，使用Col和Row。 |
| OxTabContainer | 对应Ant Design中的Tabs标签页。 |

## 2. 容器示例

这里列举一个容器配置的例子。





