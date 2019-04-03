# 资源文件

Zero UI中使用了资源文件的概念，主要是让应用程序和不同的资源文件绑定到一起，实现资源替换，这种设计在多语言环境中是很有效果的。

## 1. 环境变量

| 核心环境变量 | 说明 |
| :--- | :--- |
| Z\_LANGUAGE | 当前系统使用的语种，默认：cn |

设置了上述环境变量过后，系统会到下边目录去查找资源文件：

```
src/cab/cn/
```

## 2. 名空间

如果创建一个`UI.js`，系统要让`UI.js`和资源文件绑定，那么首先需要在当前目录中创建`Cab.json`，它的格式如下：

```json
{
    "ns":"components/<m>/<p>"
}
```

> 注，名空间不包括src/cab/cn部分

创建好该文件过后，就可以直接在`UI.js`中透过@zero注解绑定好文件，开始使用了。

## 3. 资源定义

资源文件中的格式一般如：

```json
{
    "_message":{
        "title":"Hello World"
    }
}
```

* 所有资源文件都必须是一个JsonObject格式的文件。
* 资源文件的根键必须带单下划线`_`前缀。

## 4. 绑定代码

绑定代码位于组件的定义层，关于绑定细节参考：[ZUA-002 和资源文件绑定](/zero-ui/4-zero-uishi-zhan-fen-xi/zua-002-he-zi-yuan-wen-jian-bang-ding.html)。
