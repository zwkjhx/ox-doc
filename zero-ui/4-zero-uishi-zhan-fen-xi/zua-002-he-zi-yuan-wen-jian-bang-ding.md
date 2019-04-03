# 和资源文件绑定

由于Zero UI中已经包含了默认模板，对于模板细节的开发，这里不再做详细说明，主要的连接参考前文，有下边这段代码来渲染模板内的子页面。

```jsx
const { component:Component } = this.props;
return (
    <div>
        <Component/>
    </div>
)
```

本章我们继续在第一章的Demo中修改，把中间显示的文字改成多语种。

## 1. 创建资源文件

创建下边两个文件

```
src/cab/cn/components/test/page/UI.json
src/cab/en/components/test/page/UI.json
```

上述文件中的内容分别为：

```json
{
    "_message": {
        "title": "你好，浪浪"
    }
}
```

```json
{
    "_message": {
        "title": "Hello Lang"
    }
}
```

## 2. 创建Cab.json

在当前页面目录中创建`Cab.json`文件：`src/components/test/page/Cab.json`。

```json
{
    "ns": "components/test/page"
}
```

## 3. 修改UI.js

将UI.js修改成下边这种：





