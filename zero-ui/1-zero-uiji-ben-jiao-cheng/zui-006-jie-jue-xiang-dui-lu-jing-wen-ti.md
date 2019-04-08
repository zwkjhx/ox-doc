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



