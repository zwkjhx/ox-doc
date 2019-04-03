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

```
src/cab/cn/components/test/page/UI.json
src/cab/en/components/test/page/UI.json
```



