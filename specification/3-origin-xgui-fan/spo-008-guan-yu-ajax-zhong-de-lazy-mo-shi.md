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



