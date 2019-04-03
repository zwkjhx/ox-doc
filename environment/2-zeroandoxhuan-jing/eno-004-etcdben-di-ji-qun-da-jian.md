# Etcd本地集群搭建

由于Zero容器使用了Etcd作为微服务的注册中心，最终Api Gateway会连接Etcd集群来完成请求转发，所以本文介绍如何在本机搭建一个Etcd本地化的集群（三个节点的伪集群）。

## 1. 安装

如果是搭建本地的Etcd集群，有两种模式：

* 若要以Docker方式运行，则考虑使用：[https://github.com/soyking/e3w](https://github.com/soyking/e3w)完成一建式部署。
* 如果是在本机运行，则需要先安装 Etcd，保证 `etcd`命令可用。





