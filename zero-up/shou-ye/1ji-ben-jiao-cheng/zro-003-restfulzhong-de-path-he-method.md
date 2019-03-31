# RESTful中的Path和Method

> 本篇主要针对RESTful中的“路径”和“方法”进行解读，学习如何在Zero中开发不同类型的RESTful服务让开发人员进一步了解Zero。

## 1.RESTful中的路径

> 从RESTful兴起过后，设计URI一直是开发人员比较头痛的问题，通常我们把URI中带有“模式匹配”的这一类URI都使用URI中的Path来定义，有时候口语中也会说是“路径”模式。

### 1.1. URI设计

在使用Zero开发RESTful的Web服务之前，先简单看一下下边两个URI的区别：

* `/api/user?name=Lang`
* `/api/user/lang - (/api/user/{name})`

从使用上看来，上述的两个URI是没有区别的，它所描述的含义是一致的，甚至有些开发人员都会从性能上去考虑说路径格式下的性能上会有很大的差异（解析损耗），而等你开发过企业服务过后，你会觉得，那一点点性能差异实际上是可以忽略不计的——别忘了，RESTful是为了描述资源而存在的，并不是为了不让你使用而存在的，所以很多信仰所谓的性能而直接弃之不用，那么只能说它不懂RESTful。

为什么选择后者？作者谈谈个人的看法：

1. 基于“路径”模式的URI本身就是RESTful提供的一种功能，这样的模式方便扩展，比如上述的URI，如果可以使用`/api/user/{name}`描述某个用户信息，那么该用户的一些细节信息可以直接使用类似：`/api/user/{name}/address`或`/api/user/{name}/payment`来实现平滑扩展，其含义是不言而喻的。
2. 因地制宜，并不是说所有的RESTful都需要设计成“路径”模式，很多时候需要根据实际的“业务含义”来选择合适的URI，如果选择的URI无法清晰表达您所需要的“业务含义”，那么您所设计的这个URI就是“别扭”的（我们姑且不说是错误的）。
3. 最后再次强调，企业服务应用的系统设计是为了支撑“业务”而存在，而不是为了告诉甲方你的系统很快很牛，合理选择适当的手段去描述真正的“业务意义”，描述现实场景才是系统的职责所在，但凡为了技术而技术的设计，在所有企业服务中都会显得“鸡肋”——根据实际经验可以感受到，对甲方而言，系统很快是在完成了业务需求基础之上的一种“优化”，并不是衡量一个系统单一的指标，不是说开发一个系统不讲究性能，而是需要在合情合理的情况下去考虑性能。

### 1.2. 关于URx不得不说

很多开发人员不清楚URI、URL和URN的区别，甚至很多时候开发人员会将这三个概念直接混淆，先看看三者的定义：

* URI——Uniform Resource Identifier，统一资源标识符，用来唯一标识某个资源。
* URL——Uniform Resource Locator，统一资源定位符，URL可以用来标识某个资源，而且还指明了如何对该资源进行“定位（Locate）”。
* URN——Uniform Resource Name，统一资源命名符，通过“名字”来标识该资源。

首先需要弄清楚的一点是：URL和URN都是URI的子集，换言之URL和URN都是URI，但URI不一定是URL或URN。实际上：

1. URL是URI的一种，它不仅标识了Web资源，还指定了操作或者获取方式，同时指出主了访问机制，以及资源的网络位置。
2. URN也是URI的一种，它使用特定的命名方式来标识Web资源，使用URN可以在不知道其网络位置、访问方式的情况下访问在资源。

### 1.3. Zero中对Path的支持

Zero中针对RESTful的`Path`的支持主要体现在支持JSR311规范中的`javax.ws.rs.Path`注解，Zero中支持两种注解模式。

【项目】

* `vertx-zeus/up-rhea`

#### 1.3.1. 同时使用在：类/方法

```java
package up.god.micro.path;

import io.vertx.up.annotations.EndPoint;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@EndPoint
@Path("/api")
public class PathBoth {

    @Path("/path/both")
    @GET
    public String sayBoth() {
        return "Hi, welcome to path both ( Class / Method )";
    }
}
```

上述代码中`javax.ws.rs.Path`同时注解了类和方法，这种情况下，最终表示的URI为：`/api/path/both`。

#### 1.3.2. 仅使用在：方法

```java
package up.god.micro.path;

import io.vertx.up.annotations.EndPoint;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@EndPoint
public class PathMethod {

    @Path("/api/path/method")
    @GET
    public String sayBoth() {
        return "Hi, welcome to path both ( Method Only )";
    }
}
```

上述代码中，虽然`javax.ws.rs.Path`并没有注解`PathMethod`类，但对Zero而言，这种写法也是合法的，因为PathMethod类是一个`@EndPoint`，那么它会扫描该类，若类本身没有被`javax.ws.rs.Paht`注解，URI的根地址会从方法中的值开始，上述例子中同样描述了：`/api/path/method`这个URI。

#### 1.3.3. 使用场景

很多人也许会困惑，上述两种模式的区别在什么地方？其实很多时候开发人员也许不会太在意这个问题，只要结果对（不论哪种，最终描述的URL符合预期），可能就不会去关注这种细微的区别了。归根到底这个问题的答案在于你的“代码结构设计”，类上边注解的`@Path`同样表示了这样一个含义——某一类，也就是说，当你创建了一个Java的类，而这个类下边所有的资源表示某一类信息时，可以考虑使用：`类 + 方法`的模式；而当你创建的这个Java类描述的资源比较独立时，则可以考虑：`方法`模式。

两种模式没有利弊之分，只是根据实际场景上有所区别，最终可能需要考虑的因素就是：维护的成本。当一个系统的复杂度无限制上升时，如果你的`@Path`的使用和管理比较混乱的话，或许对团队协作是一种灾难，毕竟：URI表示了资源的“唯一标识”。

## 2.RESTful中的方法

谈完了“路径”，本篇继续谈RESTful中的另外一个核心内容——方法；通常提到RESTful的方法，一般指该Web服务实现HTTP协议中的HTTP方法（常用的`GET, POST, PUT, DELETE`）。

### 2.1. 再谈幂等性（Idempotence）

在看Zero支持RESTful中的方法之前，又回到HTTP的“幂等性”——也许这是开发人员最容易忽视的一个问题。幂等性在HTTP/1.1规范中的定义如下：

> Methods can also have the property of "idempotence" in that (aside from error or expiration issues) the side-effects of N > 0 identical requests is the same as for a single request.

从定义上看，幂等性描述了这样一个概念：__一次__和__多次__请求__同一个__资源具有同样的__副作用__，很多开发工程师在实战的时候对幂等性不了了之，甚至在实现过程中完全不去考虑，这也是系统不稳定的源头——这种做法和前端开发中不考虑“防重复提交”是一脉相承。

举个例子：`POST /api/account`用来创建一个账号，当同样的请求（请求数据一致）第二次或者多次发送到这个资源地址时，系统最终的改变要维持一致。很多人会说：创建多个账号就可以了——但这真正是您所期望的？我想大多数情况下这都不是，因为请求数据中可能包含了一个人在现实生活中的唯一标识：身份证、手机号、邮箱等。那么对于创建模式，最简单的设计是：一次200 + 多次201；当然这样的设计意味着后端实现需要多一个“账号唯一标识”逻辑，但这样才会保证这个接口具有幂等性。

简言之：幂等性设计是HTTP协议的一种主要语义，有了它的存在，您所设计的RESTful才会更加规范，本文不是探讨幂等性设计的，所以有关如何设计具有幂等性的RESTful接口，读者可以在网上搜索相关资料进行完善，本文只是为了告诉读者：设计RESTful时不要忘记考虑幂等性。

### 2.2. Zero中的方法

看看下边的示例代码，Zero既然实现了JSR311，那么对方法类注解也是支持的：

```java
package up.god.micro.method;

import io.vertx.up.annotations.EndPoint;

import javax.ws.rs.*;

@EndPoint
@Path("/api")
public class MethodUsage {

    @GET
    @Path("/method")
    public String sayGet() {
        return "Hi, HttpMethod = GET";
    }

    @POST
    @Path("/method")
    public String sayPost() {
        return "Hi, HttpMethod = POST";
    }

    @DELETE
    @Path("/method")
    public String sayDelete() {
        return "Hi, HttpMethod = DELETE";
    }

    @PUT
    @Path("/method")
    public String sayPut() {
        return "Hi, HttpMethod = PUT";
    }

    @OPTIONS
    @Path("/method")
    public String sayOptions() {
        return "Hi, HttpMethod = OPTIONS";
    }

    @PATCH
    @Path("/method")
    public String sayPatch() {
        return "Hi, HttpMethod = PATCH";
    }
}
```

JSR311中主要包含了和方法相关的七种核心注解，应用于HTTP中常用的七种方法：

* `javax.ws.rs.GET`：GET方法用来请求已被URI识别的资源，根据请求该资源返回对应内容，通常用于客户端向服务端查询资源某些信息时使用，查询参数通常会追加到资源地址之后，如：`/api/user?name=Lang&email=lang.yu@hp.com`。
* `javax.ws.rs.HEAD`：HEAD方法和GET方法很类似，但服务器在响应中不会返回内容体（Body），仅仅会返回头部内容（Head），所以它允许客户端在没有获取实际资源的情况下对头部进行检查。它的优点如下：
	* 在不获取资源实际内容的情况下了解某个资源的情况。
	* 通过查看响应的状态代码，查看请求对象实际是否存在。
	* 通过检查头部信息，检查请求资源是否已经存在被修改（数据一致性问题）。
* `javax.ws.rs.PUT`：很多人觉得和GET对应的是POST，实际上是PUT，和读取内容想法相反，PUT方法主要用于向服务端写入文档，PUT实现的动作是通常意义的：“保存”，也就是说它允许客户端请求创建一个新的资源，同样也允许客户端请求修改该资源的某部分内容。
* `javax.ws.rs.POST`：该方法设计之初是往服务端输入数据用的，在传统Web应用中，通常会用来支持HTML表单提交，而在RESTful场景中，这种方法通常用于：创建实体、大内容提交、复杂查询、安全逻辑。
* `javax.ws.rs.DELETE`：DELETE方法做的事情是最单纯的，通常是请求服务端删除请求URL指定的资源，但是该请求并不意味着一定会在后端执行物理删除，也就是说客户端没有办法保证该资源一定会被删除——有可能是逻辑删除。
* `javax.ws.rs.TRACE`：TRACE请求是一种很特殊的请求，它主要用于客户端“诊断”服务端情况，它会发起一个“循环”诊断，服务端会在最后一个节点中返回TRACE响应，并在响应中携带它收到的原始请求，这样客户端就可以查看整个请求/响应链上的所有内容——意为诊断。
	* 这种操作最大的缺陷在于，它假设了中间应用程序对不同类型的请求处理逻辑维持了一致性，实际上很多业务场景中，中间逻辑往往会根据不同请求产生不同的响应，所以这种情况下TRACE实现会变得相对复杂。
* `javax.ws.rs.OPTIONS`：OPTIONS请求通常和服务端进行首次通信进行信息交换，它可以询问服务端通常支持哪些方法，或者对某些特殊资源的支持情况，然后客户端会在OPTIONS之后执行实际请求内容——它给客户端提供了一种手段，使得它不用实际访问资源而直接判断客户端是否对该资源有可访问的最优方式。

### 2.3. 实战中的“狼烟”

前边两个章节已经告诉了开发者如何去设计RESTful中的方法以及Zero中堆JSR311的方法支持的示例代码，最后再谈谈一些方法实战过程中的一些心得：如人饮水，冷暖自知。

#### 2.3.1. PUT/POST的合理设计

很多时候，我们往往被一种概念缠绕，就忘记了细节，于是很多开发人员在开发RESTful的Web服务过程中，直接有了这样一种想法：“PUT = 修改，POST = 创建”，而在某些开发人员眼中，反过来了：“PUT = 创建，POST = 修改”，我只能说这些都只是不识字乱翻书，仅仅考虑了RESTful中的“风格”一个因素——它们所争论的更多的是哪种风格更加RESTful而已。

回到2.1中讨论的，实际上POST方法和PUT方法最核心的区别依旧在于“幂等性”，而不是“风格”，有了这样的基础，你才明白POST和PUT方法正确的打开方式。在HTTP协议中，它是有明确定义的：PUT方法被定义为幂等方法，而POST则是既不安全也不幂等。

这里提供一些我们在系统设计过程中的通用心得，虽然并非法典，但可以给开发人员参考：

* PUT和POST都可以用于创建操作，有时候它们在创建过程中的区别在于：POST往往会作用于集合，如它的URI往往是：`/api/user`或`/api/users`这种；而PUT往往会作用于一个具体资源，如`/api/user/123`这种（`/api/user/123`不能狭义地表示更新123用户）。
* PUT和POST在业务语义上还有一个小区别就是：POST通常代表未知资源，如果往服务端发送请求时没有办法标识当前请求的是“哪一个”实体，那么往往使用POST；PUT则是代表已知，若往服务端发送的请求已经明确了操作的实体是“哪一个”，往往使用PUT。
* 最后可以分享的一点就是：PUT和POST并没有请求大小之分。有些开发人员认为POST往往是请求数据量大的时候使用，而PUT则是请求数据量小的时候使用，这一个概念实际上对二者的理解也想对片面了一些。

总的来说，POST和PUT的使用在实际业务场景中是最复杂的，很多时候还需要考虑的一点是整体规范统一，而也不能仅仅参考上述三条心得进行“固化”的设计，懂变化，知扩展才可以在RESTful的设计中将PUT和POST用好。

#### 2.3.2. OPTIONS碎碎念

OPTIONS方法在使用过程中往往比较“羞涩”，因为你会发现它的使用一般不在“明面”，而是在“容器”这一层，很多时候不需要开发人员去明确开发一个OPTIONS方法的接口，但针对这种类型的请求，却在潜移默化中使用到了。

OPTIONS方法的响应是不能缓存的，通常是检查服务端的一些选项，进行二次请求发送。如果它包含了正文（Body部分，包含了Content-Length或Transfer-Encoding），那么一定需要设置Content-Type来执行媒体类型，406和415的状态代码检查部分往往就是在这里被设置的。

一般OPTIONS方法实际用途有两个：

1. 获取当前请求URI在服务器支持的HTTP方法表，这一点很容易被黑客所利用，如果发送实际请求使用了没有出现在OPTIONS响应中的HTTP方法，则服务端抛出405的状态代码。
2. 检查服务器的性能，如AJAX中的跨域请求检查，通常会在首次请求中检查跨域设置，然后向另外一个资源发送实际请求，此时发送的请求是被判断为符合跨域访问策略的请求的。

## 3. 总结

本篇主要介绍Zero中对RESTful的Web服务的“路径”和“方法”的支持程度，核心着眼于如何在这两个核心概念中设计规范的RESTful服务。RESTful设计一直是Web应用中的挑战，所以本文有很多实战过程中的心得分享，这些心得不一定是最好的，所以只能靠读者取其精华、退其糟粕，最终需要开发人员对RESTful的实战开发有一个理性而客观的认识，当然后续的文章中还会谈到这方面的内容，毕竟Zero就是为了RESTful的Web服务开发量身打造的东西。