# Zero基本开发规范

## 0. 术语

* &lt;app&gt;：应用程序缩写，表示项目本身的名字。
* &lt;module&gt;：模块缩写，表示项目中某个服务的名字。

## 1. 全局规范

### 1.1. 包规范

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

## 2. 模块内部规范

Zero中的一个服务中使用的基本规范如下：

根包名使用：`com.<app>.micro.<module>`

这里提到的内部包规范是当前模块想对复杂的时候，如果比较简单，直接将所有文件扔在这个模块的根包内页不会有影响，如：

```
com/htl/micro/rent/RentApi.java
com/htl/micro/rent/RentIrApi.java
com/htl/micro/rent/RentWorker.java
com/htl/micro/rent/RentStub.java
com/htl/micro/rent/RentService.java
```

### 2.1. 基本包定义

| 包名 | 职责 | 含义 |
| :--- | :--- | :--- |
| &lt;root&gt; | 根包，定义模块的接口 |  |
| impl | 实现包，定义模块接口对应的实现 | 如果业务逻辑复杂的时候，将所有业务逻辑实现全部放到单独的子包中。 |


