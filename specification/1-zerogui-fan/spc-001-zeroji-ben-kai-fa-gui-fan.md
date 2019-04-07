* [ ] # Zero基本开发规范

## 0. 术语

* &lt;app&gt;：应用程序缩写，表示项目本身的名字。
* &lt;module&gt;：模块缩写，表示项目中某个服务的名字。

## 1. 包名规范

Zero中由于使用了微服务的整体结构，所以对于使用Zero开发的某一个项目而言，基本的包规范如下：

根包名直接使用：`com.<app>`的格式。

| 包名 | 职责 | 含义 |
| :--- | :--- | :--- |
| aop | AOP切面专用包 |  |
| cv | 全局常量文件包 | Constant Value的缩写 |
| domain | 领域模型包 | Jooq生成，包含了Domain部分的领域模型，也包含生成的Dao文件。 |
| epic | 可共享Monad专用工具类 | 可用于调用远程Rpc，也可做服务通信客户端，或者初始化、响应处理某一类的基础工作，属于原来业务逻辑层中类似Helper的功能。——这里的静态方法可直接作为Future的compose方法的参数来处理。 |
| exception | 全局异常专用包 | 用于定义一些业务层面的全局异常信息。 |
| ipc | 服务内部通信Rpc服务端 | 当微服务相互通信的时候，这个包中放的就是内部通讯时开放给其他服务的Rpc接口。 |
| micro.&lt;module&gt; | 某个服务所有组件 | 定义某个服务中的所有组件信息，包括RESTful的Api、Agent/Worker、业务逻辑层接口和实现（Stub/Service）。 |
| wall | 当前服务的安全组件 | 墙，不论安全与否，墙这个词语对于中国人而言，一定会联想到安全相关。 |

## 2. 类名规范

| 包 | 示例类名（I-接口/C-类） | 规则/示例 | 含义 |
| :--- | :--- | :--- | :--- |
| aop | AuditAop \[C\] | 直接使用Aop后缀 | 直接告诉开发人员这个类就是Aop部分的代码。 |
| cv | Addr \[I\] | 地址常量 | Address的简称，连接Agent和Worker的EventBus中的地址表。 |
| cv | Pojo \[I\] | 领域模型映射常量 Pojo | 使用Pojo直接会让开发人员联想到和Java中的Domain相关。 |
| epic | OrderAider \[C\] | 使用Aider后缀 | aider的含义在英文翻译中有：辅助、后援的意思，实际上是业务逻辑层的辅助工具类。 |
| exception | HotelMissingException \[C\] | 所有异常类直接使用Exception后缀 |  |
| ipc | MenuIvy \[C\] | 统一使用Ivy的后缀命名 | Ivy有常春藤的含义，由于这个包中包含的是开放给内部服务的Rpc接口，Rpc又是长连接，一旦调用后会保持，加上Ivy的名字比较短，所以用了该命名。 |
| micro.&lt;module&gt; | RoomApi \[I\] | 所有RESTful接口类统一使用Api后缀 |  |
|  | RoomIrApi \[I\] | 查询和基础接口分离的时候，查询类的使用IrApi后缀 | Ir全称：Information Retrieval，信息检索。 |
|  | RoomStub \[I\] | 业务逻辑接口类统一使用Stub的后缀 | Stub在Java语言的RMI中有存根的意思，实际上是不带实现的远程调用接口。 |
|  | RoomAgent \[C\] | 非接口模式的Zero RESTful接口类统一使用Agent后缀 |  |
|  | RoomWorker \[C\] | 后台Worker线程专用，统一使用Worker后缀 |  |
|  | RoomService \[C\] | 实现了Stub的业务逻辑实现类 | Service就是服务，不是接口，直接使用该名字描述服务的内容。 |

## 3. 其他规范

### 3.1. Addr中的变量名和字符串值

本文中的规范是Zero中我们实战常用规范，不一定是最优化，但开发人员遵循这个规范来开发项目，可以将Zero用得更加得心应手。

| 规则 | 示例 |
| :--- | :--- |
| Addr的地址名称统一使用 EVENT://ADDR/ 前缀，全大写 | EVENT://ADDR/PAYBILL/PUT |
| Addr中的变量名和字符串中的文字一致 | PAYBILL\_PUT |

示例代码

```java
String PAYBILL_PUT = "EVENT://ADDR/PAYBILL/PUT";
```

### 3.2. Api中的方法定义

Zero中的API、方法定义相关信息相对比较复杂，它的完整规范参考：[SPC-002 API和方法设计规范](/specification/1-zerogui-fan/spc-002-apihe-fang-fa-she-ji-gui-fan.html)。

### 3.3. 服务通信





