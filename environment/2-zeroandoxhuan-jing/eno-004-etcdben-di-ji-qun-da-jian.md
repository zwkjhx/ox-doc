# Etcd本地集群搭建

由于Zero容器使用了Etcd作为微服务的注册中心，最终Api Gateway会连接Etcd集群来完成请求转发，所以本文介绍如何在本机搭建一个Etcd本地化的集群（三个节点的伪集群），也可直接参考：[https://github.com/etcd-io/etcd/releases](https://github.com/etcd-io/etcd/releases)。

## 1. 安装

如果是搭建本地的Etcd集群，有两种模式：

* 若要以Docker方式运行，则考虑使用：[https://github.com/soyking/e3w](https://github.com/soyking/e3w)完成一建式部署。
* 如果是在本机运行，则需要先安装 Etcd，保证 `etcd`命令可用。

Mac OS中安装etcd想对简单，直接使用：

```shell
brew install etcd
```

直接在Etcd的Github地址中下载Windows版本的etcd：[https://github.com/etcd-io/etcd/releases](https://github.com/etcd-io/etcd/releases)，然后将解压过后的`etcd.exe`配置到环境变量`PATH`中，保证`etcd`的命令可用即可。

## 2. 配置

### 2.1. 数据目录

在自己的本机搭建不同节点的数据目录：

```shell
Node1：/Users/lang/Runtime/data/etcd/node1/*
Node2：/Users/lang/Runtime/data/etcd/node2/*
Node3：/Users/lang/Runtime/data/etcd/node3/*
```

### 2.2. 书写启动脚本

为了方便读者区分，将启动脚本分开呈现：

node1.sh：

```shell
#!/usr/bin/env bash
export ETCDCTL_API=3
rm -rf /Users/lang/Runtime/data/etcd/node1/*         # 开发模式专用
etcd --config-file ./tool/etcd3-cluster/etcd-1.yml
```

node2.sh：

```shell
#!/usr/bin/env bash
export ETCDCTL_API=3
rm -rf /Users/lang/Runtime/data/etcd/node2/*         # 开发模式专用
etcd --config-file ./tool/etcd3-cluster/etcd-2.yml
```

node3.sh

```shell
#!/usr/bin/env bash
export ETCDCTL_API=3
rm -rf /Users/lang/Runtime/data/etcd/node3/*         # 开发模式专用
etcd --config-file ./tool/etcd3-cluster/etcd-3.yml
```

上述启动脚本不需要过多说明，由于使用的是开发模式，所以会在启动的时候删除三个数据目录，真正的使用模式下可以去掉上述注释的开发模式专用的行。

### 2.3. 配置文件

接下来看看三个配置文件：

etcd-1.yml

```yaml
name: etcd_1
data-dir: /Users/lang/Runtime/data/etcd/node1
listen-client-urls: http://127.0.0.1:6179
advertise-client-urls: http://127.0.0.1:6179
listen-peer-urls: http://127.0.0.1:2379
initial-advertise-peer-urls: http://127.0.0.1:2379
initial-cluster: etcd_1=http://127.0.0.1:2379,etcd_2=http://127.0.0.1:2380,etcd_3=http://127.0.0.1:2381
initial-cluster-token: etcd-cluster-token
initial-cluster-state: new
```

etcd-2.yml

```yaml
name: etcd_2
data-dir: /Users/lang/Runtime/data/etcd/node2
listen-client-urls: http://127.0.0.1:6180
advertise-client-urls: http://127.0.0.1:6180
listen-peer-urls: http://127.0.0.1:2380
initial-advertise-peer-urls: http://127.0.0.1:2380
initial-cluster: etcd_1=http://127.0.0.1:2379,etcd_2=http://127.0.0.1:2380,etcd_3=http://127.0.0.1:2381
initial-cluster-token: etcd-cluster-token
initial-cluster-state: new
```

etcd-3.yml

```yaml
name: etcd_3
data-dir: /Users/lang/Runtime/data/etcd/node3
listen-client-urls: http://127.0.0.1:6181
advertise-client-urls: http://127.0.0.1:6181
listen-peer-urls: http://127.0.0.1:2381
initial-advertise-peer-urls: http://127.0.0.1:2381
initial-cluster: etcd_1=http://127.0.0.1:2379,etcd_2=http://127.0.0.1:2380,etcd_3=http://127.0.0.1:2381
initial-cluster-token: etcd-cluster-token
initial-cluster-state: new
```



