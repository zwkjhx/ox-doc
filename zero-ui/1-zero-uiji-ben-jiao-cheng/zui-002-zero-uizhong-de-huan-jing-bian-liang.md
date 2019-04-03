# Zero UI中的环境变量

Zero UI中使用了一部分系统环境变量用于指定当前Zero UI运行的宿主的一些信息，这些环境变量可以在最终打包成Docker镜像时直接提供，并且可以进行很灵活的全局化配置。

## 1. 环境变量文件

Zero UI中包含两套环境变量文件：

| 文件名 | 环境变量 |
| :--- | :--- |
| .env.development | 开发环境 Development |
| .env.production | 生产环境 Production |

> Zero UI中提供的所有dg前缀方法都只有在 development 开发环境中生效，也就是说，所有console中的日志信息只有开发环境会被启用，如果是生产环境这些日志将不会被打印，若要在生产环境进行脚本调试可直接使用 console 来打印日志。



