# TiDB环境

TiDB充当了Origin X Engine的元数据仓库的作用，里面主要存储了下列配置，由于它是一种MySQL兼容协议，所以最终搭建好了过后可以直接使用MySQL的客户端访问。

## 0. 安装

确保您的本机已经安装了Docker环境

```shell
# script/shell/ox-tidb.sh
# 必须进入到shell目录中执行，文件路径使用了相对路径
cd script/shell
./ox-tidb.sh
```

执行了该脚本过后，就可以启动一个新的`ox_tidb`的容器了，该脚本的内容如：

```shell

```shell
#!/usr/bin/env bash
export DATA_DIR=/Users/lang/Runtime/ox-engine/data
img_name="tidb"
container_name=ox_${img_name}

docker stop ${container_name}
docker rm ${container_name}
docker rmi ${img_name}:latest

docker build -t ${img_name}:latest -f ox-tidb .
docker run \
  -p 4000:4000 \
  -v ${DATA_DIR}:/tmp/tidb \
  --name ${container_name} ${img_name}
```
```



