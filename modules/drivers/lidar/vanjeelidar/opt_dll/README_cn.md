# **Vanjee LiDAR Driver**

## 1 使用说明 (vanjee_760)

当前仓库已经默认集成 760 的编译配置和运行时库。
如果你还在使用旧版本仓库，请先把 `build_760` 的内容合并到 `modules/drivers/lidar/vanjeelidar/BUILD`。

### 1.1 安装运行时库

进入 `opt_dll` 目录，执行脚本：

```sh
cd /apollo/modules/drivers/lidar/vanjeelidar/opt_dll
sudo chmod +x vanjee_lidar_lib_install.sh
./vanjee_lidar_lib_install.sh
```

脚本会把 `libVanJeeLaser760Filter_linux.so` 复制到：

```sh
/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar/
```

### 1.2 编译说明

如果你使用的是旧版本代码，`opt_dll/build_760` 里的 `BUILD` 配置需要包含：

- `cc_import` 引入 `opt_dll/libVanJeeLaser760Filter_linux.so`
- `-DFILTER_DLL_ENABLE`
- 运行时 `rpath` 指向 `../opt_dll` 和 `/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar`

当前仓库已经做了这些修改，不需要再手工替换。

### 1.3 启动前检查

推荐在 `modules/drivers/lidar/vanjeelidar/conf/vanjeelidar.pb.txt` 中确认：

```yaml
model: "vanjee_760"
host_msop_port: 3002
host_address: "192.168.10.6"
lidar_address: "192.168.10.13"
max_distance: 260
wait_for_difop: false
```
