# API和方法设计规范

Api类中的方法定义一般有两套，这个开发者可以根据实际情况来，这个文件接口中一般包含普通CRUD的操作接口，对于更复杂的RESTful的接口规范可以参考：[SPR-002 URI业务设计规范](/specification/4-restfulshe-ji-zhi-dao-gui-fan/spr-002-uriye-wu-she-ji-gui-fan.html)。

实体名如：user（用户）

## 1. 基本增删查改

| 方法名 | HTTP方法 | URI | 含义 |
| :--- | :--- | :--- | :--- |
| get | GET | /user/{id} | 按照id查询某个实体 |
| post | POST | /user | 创建某个实体 |
| put | PUT | /user/{id} | 按照id更新某个实体 |
| delete | DELETE | /user/{id} | 按照id删除某个实体 |
| search | POST | /user/search | 搜索用户实体信息（查询引擎），返回值是JsonObject包含了数据和总条数 |
| searchByXxx | GET | /users/status/{status} | 「多个」按照status查询用户信息，返回为JsonArray |

## 2. 批量操作

* 可带上查询树`criteria`语法。
* 返回值为JsonArray。

| 方法名 | HTTP方法 | URI | 含义 |
| :--- | :--- | :--- | :--- |
| batchGet | GET | /users | 读取所有用户，JsonArray |
| batchPut | PUT | /users | 批量更新用户 |
| batchPost | POST | /users | 批量创建用户（ID集） |
| batchDelete | DELETE | /users | 批量删除用户（ID集） |

## 3. 辅助功能

* 返回值为固定字符串：`EXISTED，MISSED`，不论哪种接口，EXISTED表示存在，MISSED表示不存在，替换原始的true/false。
* 这二者都为POST查询，可提供`criteria`语法来执行查询树。
* `updated`标记表示添加过程中检查还是更新过程：更新过程中检查是否存在需要去掉本条记录。

| 方法名 | HTTP方法 | URI | 含义 |
| :--- | :--- | :--- | :--- |
| existUser | POST | /user/exist | 检查用户是否存在，存在 = true，不存在 = false |
| missUser | POST | /user/miss | 检查用户是否不存在，不存在 = true，存在 = false |
| existWhenUser | POST | /user/exist-updating | 更新过程检查 |
| missWhenUser | POST | /user/miss-updating | 更新过程检查 |

## 4. 单记录查询

* 单记录查询中的 field = value 模式只可以输入单个条件信息。
* 在POST查询中固定使用 `/<entity>/query`模式，支持criteria语法。
* 返回值为JsonObject。

| 方法名 | HTTP方法 | URI | 含义 |
| :--- | :--- | :--- | :--- |
| getByField | GET | /user/{field}/{value} | 按照 field = value 查询用户信息 |
| getByFields | POST | /user/fetch | 按照criteria模式查询用户信息 |

## 



