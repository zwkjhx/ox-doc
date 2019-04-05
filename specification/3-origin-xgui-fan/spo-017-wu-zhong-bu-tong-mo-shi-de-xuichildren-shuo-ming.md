# 五种不同模式的xuiChildren

本文是渲染的重点，因为里面包含了整个Origin X在传数据过程中的核心继承概念，所以会通过最简化的代码来描述整个继承过程中的区别。

## 1. 分类

先看看基本分类

| 分类 | 结构 | 说明 |
| :--- | :--- | :--- |
| 标准单控件 | container + component x 1 | xuiControl的标准结构，一个container中包含了一个component |
| 标准多控件 | container + component x n | xuiControl的标准结构，一个container中包含了多个component |
| 容器子控件 | component = control | component位置上配置的是一个容器行的组件，子组件充当了容器作用 |
| 状态容器 | container中使用了state | container会将计算的一些state状态结果传递给component |



