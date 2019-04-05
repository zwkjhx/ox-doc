# 查询参数criteria配置解析

## 1. criteria配置

在`Zero / Zero UI / Origin X`中有一种特殊的查询请求：POST查询，并且该查询主要包含了特殊参数：

```json
{
    "criteria":{
    },
    "pager":{
        "page":1,
        "size":10
    },
    "sorter":[
        "name,DESC"
    ],
    "projection":[
    ]
}
```

那么不论是Zero UI还是Origin X，都需要将查询部分配置的`criteria`的数据解析出来才可以真正投入到实战中，关于查询引擎部分的语法可以参考：[KMZ-001 查询引擎语法](/uniform-documentation/zerohe-xin-li-lun/kmz-001-cha-xun-yin-qing-yu-fa.md)。

## 2. 基本说明

比如现在有一个请求的URI如：`/app/:appId/menus`，那么这个时候的`appId`应该如何配置呢？你当然会说，直接在代码里写！——我承认这是一个不错的解决方案，但是别忘了Origin X是数据驱动的，Zero UI是配置驱动的，也就是说如果使用了硬编码，而不是配置/数据层面的方式，若是编码的方式来处理输入参数是没有问题的，但这个查询本意是：“按照应用查询。”——如何用数据和配置来表示这个语义，就是Zero UI/Origin X解决的事情，二者使用了同样的criteria配置解析流程。

比如下边这个片段：

```json
{
    "criteria":{
        "category,i","ENUM:PROD`STG`DEV"
    }
}
```

如何解释上边的表达式呢？

* 需要查询 category 字段，使用的操作符为`IN`操作符。
* 查询的category字段的Where条件右值是一个固定枚举集合。
* 这个集合的值为：`PROD、STG、DEV`三个。

也就是说，如果category对应的底层数据库字段为：`CATEGORY`，那么这个查询生成的SQL语句的Where子句为：

```sql
CATEGORY IN ('PROD','STG','DEV')
```

## 3. 配置清单

上边最容易让开发人员不懂的就是语法，查询配置的语法左值实际上和Zero中的查询引擎左值是一致的，这里列举Zero UI中支持的右值部分——所有的配置都是以下边这种格式：

```
配置前缀:规则
```

### 3.1. PROP

PROP前缀用于从当前组件的 props 中提取数据，根据Zero UI的基本规范，props中的所有变量都应该满足下边条件：

* 必须以 `$`操作符开头。
* 类型应该是一个DataObject或DataArray。

那么PROP的语法如下：

```json
{
    "appId,=":"PROP:app.key"
}
```

这种做法等价于：

```js
const { $app } = this.props;
if($app.is()){
    const appId = $app._("key");
}
```

如果得到的值为：061f0cf8-045b-4f77-bed9-0ffae428e89d，那么生成的最终SQL语句为：

```sql
-- appId对应的列为APP_ID
APP_ID = '061f0cf8-045b-4f77-bed9-0ffae428e89d'
```

### 3.2. FIX

FIX前缀用于设定固定值，这里输入什么值就应该是什么值。

如：

```json
{
    "status,=":"FIX:TEST"
}
```

生成的SQL为：

```sql
-- status对应的列为STATUS
STATUS = 'TEST'
```

### 3.3. BOOL

对于布尔语句，是需要执行特殊转换的，所以需要有一个专程的针对Bool值的处理，如：

```json
{
    "active,=":"BOOL:true"
}
```

那么生成的SQL为：

```sql
-- active对应字段ACTIVE
ACTIVE = TRUE
```

### 3.4. ENUM

对于枚举值，会使用IN语法，如：

```json
{
    "category,i","ENUM:PROD`STG`DEV"
}
```

生成的SQL语句如：

```sql
CATEGORY IN ('PROD','STG','DEV')
```

### 3.5. OPERATOR

OPERATOR是特殊连接符，主要用于设置当前这个查询条件的连接关系是AND还是OR。





