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
    "layout": {
    },
    "ajax": {
        "category.ci.type": {
            "uri": "/api/:appId/category/by/type",
            "query": {
                "criteria": {
                    "appId": "PROP:app.key",
                    "type": "FIX:ci.type"
                }
            }
        },
        "default.column.full": {
            "uri": "/api/model/ci.device/columns"
        },
        "default.column.my": {
            "uri": "/api/model/ci.device/my/columns"
        },
        "default.data": {
            "uri": "/api/ci/search",
            "method": "POST",
            "query": {
                "projection": [],
                "pager": "1,5",
                "sorter": "createdAt=DESC",
                "criteria": {
                }
            }
        }
    },
    "page": {
        "layout": [
            [
                {
                    "span": 5,
                    "value": [
                        "54740a4b-1257-4985-a8f5-d49ad76852d5"
                    ]
                },
                {
                    "span": 19,
                    "value": [
                        "73ac2517-15f9-42be-b187-e571af54ede9"
                    ]
                }
            ]
        ],
        "container": null
    },
    "control": {
        "54740a4b-1257-4985-a8f5-d49ad76852d5": {
            "container": {
                "name": "OxCard",
                "config": {
                    "padding": false,
                    "header": false
                }
            },
            "component": {
                "name": "OxCategory",
                "data": "category.ci.type",
                "event": [
                    {
                        "name": "onQueryOnly",
                        "config": {
                            "target": "73ac2517-15f9-42be-b187-e571af54ede9",
                            "query": {
                                "key": ":modelId"
                            }
                        }
                    }
                ],
                "config": {
                    "tips": "条件",
                    "mapping": {
                        "display": "name",
                        "branch": "parentId"
                    }
                }
            }
        },
        "73ac2517-15f9-42be-b187-e571af54ede9": {
            "container": null,
            "component": {
                "name": "OxAssist",
                "config": {
                    "assist": [
                        {
                            "ajax": "default.column.full",
                            "assist": {
                                "key": "column.valid.full"
                            }
                        },
                        {
                            "ajax": "default.column.my",
                            "assist": {
                                "key": "column.valid.my"
                            }
                        }
                    ],
                    "grid": "46c0551c-17f6-4556-8d03-1e52dc3ba479"
                }
            }
        },
        "46c0551c-17f6-4556-8d03-1e52dc3ba479": {
            "container": {
                "name": "OxCard",
                "config": {
                    "header": false
                }
            },
            "component": {
                "name": "OxTabContainer",
                "config": {
                    "defaultActiveKey": "keyCi",
                    "type": "card",
                    "tabs": [
                        {
                            "control": "5395d48c-3387-41e1-b40e-bd007bba539a",
                            "key": "keyCi",
                            "tab": "已确认"
                        }
                    ]
                }
            }
        },
        "5395d48c-3387-41e1-b40e-bd007bba539a": {
            "component": {
                "name": "OxTabulation",
                "data": "default.data",
                "event": {
                    "onOpenAdd": {
                    },
                    "onOpenEdit": {
                    },
                    "onBatchEdit": {
                    },
                    "onBatchRemove": {
                    },
                    "onRemove": {
                    },
                    "onSearch": {
                        "target": "5395d48c-3387-41e1-b40e-bd007bba539a",
                        "query": {
                            "name,c": ":value"
                        }
                    },
                    "onPopover": {
                    },
                    "onExport": {
                    },
                    "onImport": {
                    }
                },
                "config": {
                    "header.op.add": {
                        "text": "添加",
                        "icon": "plus",
                        "event": {
                            "onClick": "onOpenAdd"
                        }
                    },
                    "header.op.batch": {
                        "more": "更多操作",
                        "items": [
                            {
                                "text": "批量编辑",
                                "icon": "edit",
                                "event": {
                                    "onClick": "onBatchEdit"
                                }
                            },
                            {
                                "text": "批量删除",
                                "icon": "remove",
                                "event": {
                                    "onClick": "onBatchRemove"
                                }
                            }
                        ]
                    },
                    "header.op.search": {
                        "placeholder": "请输入配置项",
                        "event": {
                            "onSearch": "onSearch"
                        }
                    },
                    "header.op.assist": [
                        {
                            "icon": "caret-down",
                            "tips": "修改显示列",
                            "event": {
                                "onClick": "onPopover"
                            }
                        },
                        {
                            "icon": "export",
                            "tips": "导出",
                            "type": "default",
                            "event": {
                                "onClick": "onExport"
                            }
                        },
                        {
                            "icon": "download",
                            "tips": "导入",
                            "type": "default",
                            "event": {
                                "onClick": "onImport"
                            }
                        }
                    ],
                    "body.column": {
                        "key": "column.valid.my",
                        "mapping": {
                            "title": "display",
                            "dataIndex": "name"
                        }
                    },
                    "body.table": {
                    }
                }
            }
        }
    }
}
```



