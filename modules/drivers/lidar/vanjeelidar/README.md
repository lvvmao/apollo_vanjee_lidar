# **Vanjee LiDAR Driver**

## 1 Introduction

 **vanjee lidar driver**  is the lidar driver kit under Apollo platform. Now, the supported lidar models include "vanjee_720_16","vanjee_720_32","vanjee_722","vanjee_722f","vanjee_750" and "vanjee_760".

 **If you need to use the lidar model "vanjee_760", please refer to (opt_dll/README.md).**

## 2 How to use vanjee_760

The current repository has integrated the build configuration for 760 and external filtering libraries by default. If you are using an older version of the repository, replace `BUILD` following the instructions in `opt_dll/README_cn.md`.

### 2.1 Install 760 dependency libraries

Enter the `opt_dll` directory and run the installation script:

```sh
cd /apollo/modules/drivers/lidar/vanjeelidar/opt_dll
sudo chmod +x vanjee_lidar_lib_install.sh
./vanjee_lidar_lib_install.sh
```

The script will copy `libVanJeeLaser760Filter_linux.so` to the runtime directory:

```sh
/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar/
```

### 2.2 Check the configuration file

The default configuration file is:

```sh
/apollo/modules/drivers/lidar/vanjeelidar/conf/vanjeelidar.pb.txt
```

When using the 760, verify at least the following parameters:

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

`host_address` and `lidar_address` shall be changed to the actual network segment addresses on site.

### 2.3 Start the driver

```sh
cyber_launch start /apollo/modules/drivers/lidar/vanjeelidar/launch/vanjeelidar.launch
```

OR：

```sh
mainboard -d /apollo/modules/drivers/lidar/vanjeelidar/dag/vanjeelidar.dag
```

### 2.4 Check the output

Default topic:

- `/apollo/sensor/vanjeelidar/up/PointCloud2`
- `/apollo/sensor/vanjeelidar/up/Scan`

If no point cloud is output, check the following three items first:

1. Whether `model` is set to `vanjee_760`.
2. Whether `libVanJeeLaser760Filter_linux.so` has been installed to the runtime directory.
3. Whether `host_msop_port`, `host_address`, and `lidar_address` match the actual lidar configuration.

## 3 Run

**All the drivers need to be excuted in Apollo docker environment.**

```sh
cyber_launch start /apollo/modules/drivers/lidar/vanjeelidar/launch/vanjeelidar.launch
```

or

```sh
mainboard -d /apollo/modules/drivers/lidar/vanjeelidar/dag/vanjeelidar.dag
```

default topic name：

- raw point cloud -- /apollo/sensor/vanjeelidar/up/PointCloud2"
- Scan--/apollo/sensor/vanjeelidar/up/Scan

## 4 Parameters Intro

[Intro to parameters](doc/parameter_intro.md)
