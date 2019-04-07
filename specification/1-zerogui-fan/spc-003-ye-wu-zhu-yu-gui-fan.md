# 业务术语规范

业务术语规范用语定义一些固定的业务层面的含义规范，方便开发人员统一理解。

## 1. API方法定义

API方法定义描述了在Agent/Api两种Java文件中方法的名字。

| 项 | 含义 |
| :--- | :--- |
| get | 读取单条记录的专用前缀，只用于描述按照 id = value的方式查询单条记录的结果。 |
| post | 创建记录专用方法 |
| put | 更新记录专用方法 |
| delete | 删除记录专用方法 |
| batchXxx | 所有批量操作使用batch作为方法前缀 |
| exist/miss | 辅助方法常用的是检查这个记录是否存在，直接使用exist/miss前缀，返回值统一 |
| getByXx | 按照某个字段查询单条记录返回JsonObject |
| queryXx | 按照某个条件查询多条记录返回JsonArray |
| search | 按照某个条件查询多条记录，返回JsonObject（list,count），带分页、排序、列过滤、查询树 |

* API中的标准方法定义和HTTP Method对应，使得开发人员不用去思考POST/PUT究竟哪个规则用于更新。
* 批量全部使用batch方法名前缀。
* 将query/search的返回值进行限定，query只返回JsonArray，有多少条返回多少条，search返回一个JsonObject，主要是带`list`和`count`两个属性，用于处理分页数据。

## 2. Worker方法

Worker方法名称定义了Api层的专用方法名称，并且可触发Aop层的Audit设置操作

| API | Worker中方法 |
| :--- | :--- |
| get | read |
| post | create |
| put | update |
| delete | remove |
| exist/miss | check |
| query/search | fetch（Jooq底层统一） |

* 上述方法直接可以通过`Ux.Jooq`的模式统一执行，所以不需要开`Stub/Service`的业务逻辑层来完成。
* 除了上边的属于对应之外，其他的想对自由。
* 由于`Ux.Jooq`已经生成了Dao层，所以不需要类似`insert/update/select/delete`等这种数据层的方法来描述行为。

## 3. 其他业务谓词

| 词语 | 含义 | 协变规则 |
| :--- | :--- | :--- |
| get | 读取 | 【无】不可用于底层，只能使用于API接口定义中，禁止在底层Dao/Service中使用getBy，getX等方法，底层的Get表示Bean的“获取”方法。 |



