# ox-ui 环境搭建

ox-ui项目就是Origin X Engine的前端主项目（需授权才可访问），这里提供Origin UI的整体环境搭建流程，方便Origin X的研发人员使用。

## 1. 下载和运行

下载代码的本地：

```shell
git clone https://github.com/silentbalanceyh/ox-ui.git
```

进入到代码目录

```shell
cd ox-ui
```

执行下边命令安装依赖包

```shell
npm install
```

安装完成后直接启动

```shell
# Linux中
./run-zero.sh
# ( Windows )中使用
./run-zero.bat
```

> Ox UI的启动脚本和Zero UI的启动脚本一致，由于使用了路由连接器，这个脚本在启动的时候在打包之前会生成一部分代码，所以直接使用npm start可能会有些问题。

## 2. 环境限制

### 2.1. 基本环境

| 项 | 版本要求 |
| :--- | :--- |
| node | &gt; 8.x（建议升最新版11.x） |

> Origin X UI和Zero UI一样，都是直接可以用node运行的，所以安装了nodejs过后就可以直接运行了。

### 2.2. 限制环境

限制环境中包含了一些在`package.json`中定义的无法升级的包

| 包名 | 版本限制 |
| :--- | :--- |
|  |  |



