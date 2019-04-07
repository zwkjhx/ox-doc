# Zero框架内部组件说明

Zero框架中使用了很多后缀命名法用于定义不同的组件，本文主要讲解某些后缀下的不同组件对应的职责以及含义，方便开发者阅读Zero本身的代码。

## 1. 组件

| 组件 | 详细说明 |
| :--- | :--- |
| VertxApplication / DansApplication | 标准服务入口 / ApiGateway服务应用入口。 |
| Scatter | 启动器子线程，包含：Agent扫描线程、Worker扫描线程、Infix插件扫描线程、Rule规则扫描线程四种。 |
| Visitor | 配置访问器，分两种：纯数据系列如读取JsonObject/JsonArray；特殊DTO系列，如Vert.x Options，Server Options等。 |
| Node&lt;T&gt; | 配置数据解析器，主要分：解析 vertx.yml文件、解析vertx-inject.yml 文件扫描Infix插件、解析 lime节点、解析统一配置——分层、合并处理。 |
| Launcher | 启动器，会被 Application 调用，并且启动 Vert.x 实例，启动器分两种：标准模式 / Rx模式（平行世界，使用了rxjava库的启动模式）。 |
| Infix | Zero中的插件，有插件专用接口用于扩展Zero。 |
| Endurer | 「**Handler**」错误响应器，一般用于 failureHandler 的生成过程，一旦在请求过程发生了错则启用错误响应器。 |
| Filter | JSR340过滤器规范支持接口。 |
| Factor | 内置启动因式，由于启动器内部的启动流程有所区别，在微服务的API Gateway模式、WebSocket模式、RESTful标准服务模式使用不同的Factor来处理，Factor会处理一个Vert.x中开启多个服务器的模式——不同的服务器需要挂载的Agent会有所区别。 |
| Inquirer | 组件扫描器，主要用于扫描不同组件而定义：扫描Agent、Worker、EndPoint地址、插件等等。 |
| Saber | 序列化组件，针对不同的Java原生类型，除开jackson本身的序列化过后，提供特殊类型的序列化子系统，完成Web Service的序列化子系统定义。 |
| Monitor | 健康检查器，用于微服务模式下检查各个节点心跳、收集数据，监控流量而定义。 |
| Security | 安全相关墙专用接口，用于定义和@Wall绑定的安全过滤AOP组件。 |
| Ostium | 认证/授权组件专用孔，用于插入不同模式下的安全组件实现，方便进行替换，目前支持Basic和OAuth（JWT）两种。 |
| Sentry | 哨兵/信号量，标准前置验证器，用于验证请求生成400/401/403/500前置请求错误专用，可定义标准的业务规则用于做请求拦截，实际上Sentry组件就是传统程序中的请求拦截器。 |
| PlugRouter | Router的扩展机制，Origin X 中使用了PlugRouter重新定义了动态路由规则，路由信息不通过Java语言中的Annotation进行静态扫描，而是直接连接到后端的路由管理数据仓库实现动态路由注册机制。从Zero中就是用PlugRouter进行直接的路由扩展。 |
| Filler | 请求参数处理器，针对JSR311以及311的扩展，处理不同的请求参数，统一成后端专用的数据格式，方便组件和组件之间通过DTO进行数据交互。 |
| Extractor | 配置最终抽取器，直接从Node接口读取到的配置数据执行规范化，生成Agent、Worker专用的配置项对象，如：Event、Receipt、DeploymentOptions等。 |
| Axis | 路由注册器，用于挂载生成好的所有路由信息到Router对象，实现路由注册机制。 |
| Aim | Handler生成器，根据不同的Java方法定义，为Zero处理请求模式进行Handler的生成，包括：One-Way、Publish-Subscribe、Request-Request、Java Async、Vertx Async五种基本模式的Handler生成都是通过Aim组件完成。 |
| Bolt | 安全模块分流器，针对不同的安全实现方式进行分流，第一层执行全扩展分流和方法扩展分流，第二层进行安全认证授权模式分流（Basic还是OAuth）。 |
| Hub | 路由挂载总线，将Event对象中扫描到的信息挂载到Route对象里，针对每一个Route对象进行细粒度扩展。 |
| Ruler | 基本数据规范验证器，验证JsonObject格式、JsonArray格式以及必须的整数、字符串长度、特殊属性，在发布之前验证配置专用。 |
| Differ | 模式分流器，根据Java方法定义，直接通过模式分流器来判断当前配置数据应该生成什么样的Aim，再调用Aim中的方法来生成对应的Handler。主要分为：前置验证分流、Http请求模式分流、Worker处理模式分流、通用分流、Rpc内部服务通信分流。 |

## 2. 特殊类



