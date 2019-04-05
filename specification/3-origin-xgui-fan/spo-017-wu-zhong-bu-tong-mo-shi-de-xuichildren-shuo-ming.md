# 五种不同模式的xuiChildren

本文是渲染的重点，因为里面包含了整个Origin X在传数据过程中的核心继承概念，所以会通过最简化的代码来描述整个继承过程中的区别。

## 1. 分类

先看看基本分类

| 分类 | 结构 | 说明 |
| :--- | :--- | :--- |
| 标准单控件 | container + component x 1 | xuiControl的标准结构，一个container中包含了一个component |
| 标准多控件 | container + component x n | xuiControl的标准结构，一个container中包含了多个component |
| 容器子控件 | component = control | component位置上配置的是一个容器行的组件，子组件充当了容器作用 |
| 状态容器 | container使用了state | container会将计算的一些state状态结果传递给component |
| 状态容器子组件 | component使用了state | component会将state的计算结果传递给它的子控件 |

## 2. 五种模式说明

本章节主要讲解五种模式的详细内容，本文以下边两个控件为例（一个是容器组件，一个是组件）：

**Outer**：容器组件

```jsx
class Outer extends React.PureComponent{
    render(){
        const { children } = this.props;
        return (
            <div>
                Container
            </div>
        )
    }
}
```

**Inner**：普通组件

```jsx
class Inner extends React.PureComponent{
    render(){
        return (
            <div>
                Component
            </div>
        )
    }
}
```

### 2.1. 标准单控件

标准单控件模式是最常用的模式，实际上只需要将上边的Outer的render方法改成下边这种就可以了：

```jsx
render(){
    const { children } = this.props;
    return (
        <div>
            Container
            {children}
            {/** 上边代码就是直接渲染组件的代码 **/}
        </div>
    )
}
```



