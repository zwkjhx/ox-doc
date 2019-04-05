# DataEvent结构说明

在Origin X中，所有的事件都是以DataEvent对象发送给目标对象的，该对象定义在`src/entity/data/DataEvent.ts`文件中，为组件通信的核心对象。

## 1. 数据结构

关于DataEvent数据结构可以参考下图：

## 2. 说明

* 每一个发送的DataEvent都有一个时间名称`name`，可直接通过`key()`的API进行获取。
* 同一个事件DataEvent可以进行复用，每一次调用`mount(params)`的时候该事件中的数据会被重置，然后调用链也会被清空。
* DataEvent对象中除了params（每次mount的当前事件的数据）以外，还包含两个核心对象：
  * source：事件源，所有属性都是`$`符号开头。



