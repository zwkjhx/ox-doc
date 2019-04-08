# 解决相对路径问题

Zero UI在传统前端开发中有一个比较大的变动，就是直接在webpack级别配置了相对路径。

示例之前，假设：

```shell
组件目录：src/components/user/manage/
工具目录：src/ux/
```

## 1. 示例对比

### 1.1. 原始代码

如果是原始前端开发，代码部分引用：

```js
import React from 'react';
import Ux from '../../../ux';    // 相对路径

class Component extends React.Component{
    render(){
        const single = Ux.elementUnique(this.props.data,"code","Single");
        return false;
    }
}

export default Component
```

### 1.2. Zero中的代码

```js
import React from 'react';
import Ux from 'ux';    // 直接引用包名

class Component extends React.Component{
    render(){
        const single = Ux.elementUnique(this.props.data,"code","Single");
        return false;
    }
}

export default Component
```

### 1.3. 优点

* 目录和目录之间不形成相互依赖，当脚本要使用相对路径的时候，仅支持`当前目录`的想对路径，这样就不会造成当前目录中的代码和外部目录之间从路径上形成依赖。
* 如果要重构，比如调整目录的时候，可直接在不改变代码的情况下直接重构，改动会小很多。

## 2. 定义

### 2.1. 定义文件

这种语法的定义部分参考两处，第一个定义文件是webpack中的配置文件，Zero UI已经将配置文件分离：

```js
// 
```





