# Ux.ajax

Ux中的ajax系列的Api方法主要提供给开发人员调用远程的RESTful服务执行前后端交互。

## 1. 基本使用

在前端调用Ux中的ajax系列方法可直接使用下边这种方式：

```js
import Ux from 'ux';
import Mock from '../mock';

export default {
    "graphic.point.types": {
        ajax: params => Ux.ajaxGet(`/api/:appId/point/types`, params, Mock.fnPointTypes),
        processor: data => ({"graphic.nodes": data})
    }
}
```

> 入口文件：src/ux/ajax/Ux.Ajax.js

## 2. API清单

说明API的时候采用下边的基础数据（前后端分离架构）：

前端路径为：[http://localhost:5000](http://localhost:5000)

后端路径为：[http://localhost:6083](http://localhost:6083)

| API签名 | 说明 |
| :--- | :--- |
|  |  |

## 3. 参数统一说明



