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
* 


