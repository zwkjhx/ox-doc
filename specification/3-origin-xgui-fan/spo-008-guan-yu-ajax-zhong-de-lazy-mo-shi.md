# 关于Ajax中的Lazy模式

Origin X中的Ajax请求支持Lazy模式——也就是延迟加载模式。

## 1. 基本配置

```json
{
    "personal.circle.by.type": {
        "uri": "/api/:modelId/columns",
        "lazy":true
    }
}
```

仔细思考，上述URI中包含了一个路径参数`modelId`，也就是说，在页面初始化的流程过程中

