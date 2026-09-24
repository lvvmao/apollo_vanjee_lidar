# **Vanjee LiDAR Driver**

## 1 工程简介

 **vanjee lidar driver** 为万集科技在阿波罗平台上的雷达驱动集成包。 目前支持"vanjee_720_16"、"vanjee_720_32"、"vanjee_722"、"vanjee_722f"、"vanjee_750"和"vanjee_760"型号的雷达。

 **如果需要使用 "vanjee_760" 型号雷达，请参考 (opt_dll/README_cn.md)**

## 2 vanjee_760 使用方法

当前仓库已经默认接入 760 的编译配置和外部滤波库；如果你使用的是旧版本仓库，再按 `opt_dll/README_cn.md` 里的说明替换 `BUILD`。

### 2.1 安装 760 依赖库

进入 `opt_dll` 目录，执行安装脚本：

```sh
cd /apollo/modules/drivers/lidar/vanjeelidar/opt_dll
sudo chmod +x vanjee_lidar_lib_install.sh
./vanjee_lidar_lib_install.sh
```

脚本会把 `libVanJeeLaser760Filter_linux.so` 复制到运行时目录：

```sh
/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar/
```

### 2.2 检查配置文件

默认配置文件是：

```sh
/apollo/modules/drivers/lidar/vanjeelidar/conf/vanjeelidar.pb.txt
```

使用 760 时，至少确认下面这些参数：

```yaml
model: "vanjee_760"
host_msop_port: 3002
lidar_msop_port: 3333
host_address: "192.168.10.6"
lidar_address: "192.168.10.13"
max_distance: 260
wait_for_difop: false
config_from_file: false
```

`host_address` 和 `lidar_address` 要改成现场真实网段地址。

### 2.3 启动驱动

```sh
cyber_launch start /apollo/modules/drivers/lidar/vanjeelidar/launch/vanjeelidar.launch
```

或者：

```sh
mainboard -d /apollo/modules/drivers/lidar/vanjeelidar/dag/vanjeelidar.dag
```

### 2.4 查看输出

默认话题：

- `/apollo/sensor/vanjeelidar/up/PointCloud2`
- `/apollo/sensor/vanjeelidar/up/Scan`

如果点云没有出来，先检查这三件事：

1. `model` 是否已经改成 `vanjee_760`
2. `libVanJeeLaser760Filter_linux.so` 是否已经安装到运行时目录
3. `host_msop_port`、`host_address`、`lidar_address` 是否和雷达实际配置一致

## 3 运行

**所有驱动均需要在Apollo Docker环境下运行**

```sh
cyber_launch start /apollo/modules/drivers/lidar/vanjeelidar/launch/vanjeelidar.launch
```

或

```sh
mainboard -d /apollo/modules/drivers/lidar/vanjeelidar/dag/vanjeelidar.dag
```

默认话题名：

- 原始点云 -- /apollo/sensor/vanjeelidar/up/PointCloud2"
- Scan--/apollo/sensor/vanjeelidar/up/Scan

## 4 参数介绍

[参数介绍](doc/parameter_intro.md)
