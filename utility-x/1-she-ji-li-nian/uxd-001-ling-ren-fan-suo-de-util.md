# 那些年的伤痛

## 1. 个人的痛点

曾几何时，我们在代码里看多了类似`ArrayUtil.sort`等各种错综复杂的API，我们一直都在开发完美的工具类，它需要：

* 支持所有通用的功能
* 有很好的复用性
* 尽可能少的BUG

于是我们开始分类，也于是，我们有了类似：ArrayUtil，StringUtil等各种不同的工具类，形成了工具库，我从来都没有说过我反感这样的做法，可是从实战上看来，典型的`2/8`法则，很多时候我们在实际项目过程中，根本用不了这么多“大而全”的东西，一个项目从最初到收尾，我们都无法将所有的`Util`了熟于心。

当一个新的项目来临，我们又开始了漫长的`Util`的工作，发现一个新的工具类，又开始替换原始的，然后又开始重复，一旦当两个工具类本身出现了不兼容的时候，痛点就开始体现出来了。

## 2. 命名的追求

### 2.1. 关于缩写

很早的时候，我们在书本上学过，不要使用混乱的缩写命名，因为别人不知道那个缩写代表什么，但并没有说过不让我们使用缩写，实际上很多时候缩写应该有它自己的位置。我一直无法苟同于Spring中Repository部分的代码生成方法的做法，虽然完美表达了意思，但方法的长度实在是让我不能认同。比如：

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

### 2.2. 关于约定

曾经，我们约定我们的数据访问层叫做`Dao`，那么它对应的实现叫做`DaoImpl`，我们业务逻辑层叫做`Service`，它们对应的实现叫做`ServiceImpl`，是的，这样的方式一直在延续——但是，这真的是一种喜闻乐见的好方式，还是说我们懒惰得不想去思考？在微服务流行的今天，究竟一个项目是“分层”还是“分模块”已经成为了一个喋喋不休的问题，而我在设计Zero的时候使用了很多奇怪的命名，但由于是“分模块”的，所以更多的时候只要心里明白，那么这个东西自然就成为了一种新的约定，渐渐的，原来我们不是习惯了约定，而是忘记了思考带来的福利。

我看到过一个项目，有一个用户相关的服务叫做：UserService，一个接口就是20个左右的方法，他告诉我不能拆，实际上我们忘记了PMD中的一个规则：一个接口最好不要超过7个左右的方法，方法太多就可以考虑重构了。事实证明，重构工作是需要更大粒度的思考的，虽然我们心里清楚这个接口中本来就应该如此这般，但其实是有更加流畅的方式来解决问题的。

**于是在Zero的开发过程中，再也没有Dao/DaoImpl、再也没有Service/ServiceImpl，而是换成了另外的名字，职责更加清晰的名字。**

我一直都告诉我身边的人，在面对技术的时候需要学会的是谦卑，当很多人给我说代码写得如何时，我一直都想到了韩寒写的那篇文章——《我也曾对那种力量一无所知》，所以一直都提醒自己，多思考，就像女蜗造人一样，造出更加精致而不失美感的东西。这里分享一份Zero中某个服务下的命名，并非法典，但是我们目前项目用得比较多的，大家可以参考：[SPC-001 Zero基本开发规范](/specification/1-zerogui-fan/spc-001-zeroji-ben-kai-fa-gui-fan.html)——我从来都不说这是一份完美的规范，但至少在实战上感觉，思路比以前更加清晰，当然一个东西的好用与否，仁者见仁智者见智。

