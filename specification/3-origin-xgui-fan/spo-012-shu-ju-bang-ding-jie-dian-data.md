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

```json
{
    "control": {
        "1d43acbc-0079-4475-b274-d32f65b7ebe7": {
            "component": {
                "name": "OxListTask",
                "data": "personal.pager.zone",
                "config": {
                }
            }
        }
    }
}
```

上述配置就让一个组件`OxListTask`的实例和`ajaxKey = personal.pager.zone`的Ajax远程接口实现了绑定，那么该接口返回的数据可以直接通过上边的JS代码获取到。

## 3. 转换

除了上边提到的数据本身的提取以外，所有的组件/容器的配置中都支持一个特殊节点：`mapping`，实现数据映射的功能，这个地方不详细说明数据映射的细节，直接通过例子来阐述。

### 3.1. 远程Ajax读取的数据：

```json

```



