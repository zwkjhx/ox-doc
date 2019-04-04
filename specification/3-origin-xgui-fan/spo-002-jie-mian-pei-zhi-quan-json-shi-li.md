# 界面配置全Json示例

## 1. 基本结构

```json
{
    "mock":true,
    "data":{
    }
}
```

上述结构是Zero UI中需要使用的模拟数据结构，所以这里不做解析，基本含义是后端真正出来的数据就是`data`节点的内容，其中`data`节点的格式参考如下：

```json
{
    "layout":{}
    "ajax":{
        "<ajax.key>":{
            "uri":"当前调用的Ajax的Uri地址",
            "method":"当前接口使用的HTTP方法",
            "query":{
                "projection":[],
                "pager":"1,3",
                "sorter":"createdAt=DESC",
                "criteria":{
                    "field":"SOURCE:object.attribute"
                }
            }
        }
    },
    "page":{
        "layout":[
            "<controlId:当前页面的Control控件，如果是字符串则表示 span = 24，满行>",
            [
                {
                    "span":16,
                    "value":[
                        "a770c579-0135-410c-a74f-42253604394c，第一行的UUID，直接control中检索",
                        "<controlId>"
                    ]
                },
                {
                    "span":8,
                    "value":[
                        "<controlId>",
                        "<controlId>"
                    ]
                }
            ]
        ],
        "container":{
            "name":"OxCard - 链接到 src/app/web/中的核心组件",
            "config":{
                "title":"标题信息"
            }
        }
    },
    "control":{
        "a770c579-0135-410c-a74f-42253604394c":{
            "container":{
            },
            "component":{
            }
        }
    }
}
```



