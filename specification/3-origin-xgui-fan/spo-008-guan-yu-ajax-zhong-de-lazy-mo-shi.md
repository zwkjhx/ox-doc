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

仔细思考，上述URI中包含了一个路径参数`modelId`，也就是说，在页面初始化的流程中，由于`modelId`未指定，这种情况下如果发送了这个请求，会导致后端无法读取数据，并且发一次废请求，也就是说这个请求不能在页面初始化的过程中发送Ajax到后端，这种情况下，就可以启用这个Ajax的lazy模式，而在后期的DataEvent中去发送请求。

## 2. 前端交互流程





