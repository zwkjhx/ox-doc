# 那些年的Util

## 1. 个人的痛点

曾几何时，我们在代码里看多了类似`ArrayUtil.sort`等各种错综复杂的API，我们一直都在开发完美的工具类，它需要：

* 支持所有通用的功能
* 有很好的复用性
* 尽可能少的BUG

于是我们开始分类，也于是，我们有了类似：ArrayUtil，StringUtil等各种不同的工具类，形成了工具库，我从来都没有说过我反感这样的做法，可是从实战上看来，典型的`2/8`法则，很多时候我们在实际项目过程中，根本用不了这么多“大而全”的东西，一个项目从最初到收尾，我们都无法将所有的`Util`了熟于心。

当一个新的项目来临，我们又开始了漫长的`Util`的工作，发现一个新的工具类，又开始替换原始的，然后又开始重复，一旦当两个工具类本身出现了不兼容的时候，痛点就开始体现出来了。

## 2. 命名的追求

很早的时候，我们在书本上学过，不要使用混乱的缩写命名，因为别人不知道那个缩写代表什么，但并没有说过不让我们使用缩写，实际上很多时候缩写应该有它自己的位置。我一直无法苟同于Spring中Repository部分的代码生成方法的做法，虽然完美表达了意思，但基本上长度很无敌，比如：

```java
@Repository
public interface GroupRepository extends JpaRepository<Group, String> {

    @Query(value = "select distinct sec_group from Group sec_group left join fetch sec_group.users",
        countQuery = "select count(distinct sec_group) from Group sec_group")
    Page<Group> findAllWithEagerRelationships(Pageable pageable);

    @Query(value = "select distinct sec_group from Group sec_group left join fetch sec_group.users")
    List<Group> findAllWithEagerRelationships();

    @Query("select sec_group from Group sec_group left join fetch sec_group.users where sec_group.id =:id")
    Optional<Group> findOneWithEagerRelationships(@Param("id") String id);

}
```

所以在很长一段时间里我一直都在追求极致，甚至比较优雅而不失实用性的命名方式。

