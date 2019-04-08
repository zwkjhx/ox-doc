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

> 除了特殊的参数提供说明，其他的API方法参考统一参数说明。

| API名称 | 说明 |
| :--- | :--- |
| ajaxResource | 读取前端某个路径下的资源，只支持GET方法，所以默认就是GET，前端站点直接调用。 |
|  | uri - 前端请求路径，如果 uri = /react/index.html，那么该请求将发送到：[http://localhost:5000/react/index.html](http://localhost:5000/react/index.html中。)中。 |
| ajaxUpload | 上传专用API。 |
|  | uri - 上传地址，前缀会引入ENDPOINT，请求最终发送给后端，如 uri = /api/attach/upload，那么请求将发送给 [http://localhost:6083/api/attach/upload](http://localhost:6083/api/attach/upload。)，只支持POST上传。 |
|  | file - 上传的文件参数，一般是 input = file 或者执行了multipart/\* 编码过的上传内容数据。 |
|  | mockData - 当前请求引入的Mock数据，遵循Zero UI中的Mock结构。 |
| ajaxDownload | 下载专用API。参数：3.1 |
| ajaxFetch | 非安全模式下的GET方法，不带token。参数：3.1 |
| ajaxPush | 非安全模式下的POST方法，不带token。参数：3.1 |
| ajaxGet | 安全模式下的GET方法，带token。参数：3.1 |
| ajaxPost | 安全模式下的POST方法，带token。参数：3.1 |
| ajaxPut | 安全模式下的PUT方法，带token。参数：3.1 |
| ajaxDelete | 安全模式下的DELETE方法，带token。参数：3.1 |
| microFetch | 同ajaxFetch。参数：3.2 |
| microPush | 同ajaxPush。参数：3.2 |
| microGet | 同ajaxGet。参数：3.2 |
| microPost | 同ajaxPost。参数：3.2 |
| microPut | 同ajaxPut。参数：3.2 |
| microDelete | 同ajaxDelete。参数：3.2 |

## 3. 统一参数说明

统一参数表示这些API所有的参数都是统一处理，参考下表：

| 参数名 | 说明 |
| :--- | :--- |
| uri | 当前请求发送的远程API地址，不带ENDPOINT部分，系统自动会注入。 |
| params | 当前请求所需要的参数，使用JavaScript中的Object表示。 |
| mockData | 当前请求依赖的Mock参数，DEV\_MOCK = true时才生效。 |
| service | Spring的原始微模式下的服务名称。 |

### 3.1. ajax系列

ajax系列的方法参数签名如下：

```js
method( uri, params, mockData );
```

### 3.2. micro系列

micro系列之所以会出现，是由于在原始的Spring Boot中的API Gateway寻找路径地址时，会多一层服务名称，如：

```shell
服务名：report
访问路径：/api/test/ok
最终访问地址：/report/api/test/ok  # 这是不深度配置的Spring的默认方式
```

所以对应ajax系列，会出现一套micro的微模式，它的签名如下：

```js
method( service, uri, params, mockData );
```

为什么不直接在路径中使用`/report/api/test/ok`，而是要抽象一个服务名称出来——其实只有一个原因：概念上讲让人员清楚这个服务本身是什么名称，用来干什么，并且当服务名称发生改变的时候，可以在整个UI项目中统一修改，而不是查找所有路径中带了该服务名称的API来进行Replace。

### 3.3. 参数替换





