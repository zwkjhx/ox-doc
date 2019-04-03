# 元数据仓库初始化

由于Origin X Engine本身使用了TiDB存储元数据，用于保存核心的引擎数据，元数据类型主要包含：

* 系统表中存储的数据：附件、类型、列表、应用、数据源、模块。
* 安全表中存储的数据：用户、角色、组、权限、资源、行为。
* 模型定义数据：实体/关系表、字段、键、索引、属性、模型。
* 接口定义数据：接口、业务组件。
* 图定义的数据：图、类型、节点、边。
* 界面定义数据：布局、页面、插槽、组件、字段、列。

由于Origin X Engine依赖 [http://www.vertxup.cn](http://www.vertxup.cn) ，所以您需要拉取最新的Zero代码在本地编译：

```shell
git clone https://github.com/silentbalanceyh/vertx-zero.git
cd vertx-zero
mvn clean package install
```

元数据仓库TiDB的搭建可以参考：。

