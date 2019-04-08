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

| API名称 | 说明 |
| :--- | :--- |
| ajaxResource | 读取前端某个路径下的资源，只支持GET方法，所以默认就是GET，前端站点直接调用。 |
|  | uri - 前端请求路径，如果 uri = /react/index.html，那么该请求将发送到：[http://localhost:5000/react/index.html](http://localhost:5000/react/index.html中。)中。 |
| ajaxUpload | 上传专用API。 |
|  | uri - 上传地址，前缀会引入ENDPOINT，请求最终发送给后端，如 uri = /api/attach/upload，那么请求将发送给 [http://localhost:6083/api/attach/upload](http://localhost:6083/api/attach/upload。)。 |

## 3. 参数统一说明



