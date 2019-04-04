# Ajax中的查询引擎

Origin X中在执行复杂查询时遵循Zero中定义的查询引擎语法，主要包含以下四个基本功能：

* 分页
* 排序
* 列过滤
* 查询树

## 1. 基本格式

回到前边的配置例子：

```json
{
    "ajax": {
        "personal.pager.zone": {
            "uri": "/api/personal/circle/search",
            "method": "POST",
            "query": {
                "projection": [],
                "pager": "1,5",
                "sorter": "createdAt=DESC",
                "criteria": {
                }
            }
        }
    }
}
```

当Ajax的定义中使用了`query`作为参数节点时，证明该Ajax触发的是后端的POST查询（HTTP方法必须为POST）。

## 2. 节点说明

这里仅仅解析`query`中的节点信息：

| 节点 | 含义 |
| :--- | :--- |
| projection | 列过滤参数 |
| pager | 分页参数 |
| sorter | 排序参数（支持多字段排序） |
| criteria | 查询树，参考： |



