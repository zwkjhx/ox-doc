# 数据绑定节点data

## 1. 基本说明

当一个组件和Ajax中定义的ajaxKey绑定过后，那么这个被绑定的数据内容会出现在props中的专用属性`data`里，也就是说一旦实现了绑定，那么您就可以直接使用如下代码来提取这个数据：

```js
const { data = {} } = this.props;
// 或
const { data = [] } = this.props;
```

从某种意义上说，这里的`data`变量才表示当前控件Control使用的“主实体”数据。

## 2. 配置

一般这个绑定关系是在`component`的`data`节点中配置的，如下：





