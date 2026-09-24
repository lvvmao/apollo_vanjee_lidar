# **Vanjee LiDAR Driver**

## 1 User Guide (vanjee_760)

**The current repository has the build configuration and runtime library for the 760 integrated by default.
If you are still using an older version of the repository, merge the contents of `build_760` into `modules/drivers/lidar/vanjeelidar/BUILD` first.**

### 1.1 Install Runtime Library

Enter the `opt_dll` directory and execute the script:

```sh
cd /apollo/modules/drivers/lidar/vanjeelidar/opt_dll
sudo chmod +x vanjee_lidar_lib_install.sh
./vanjee_lidar_lib_install.sh
```

The script will copy `libVanJeeLaser760Filter_linux.so` to:

```sh
/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar/
```

### 1.2 Build Instructions

For legacy code versions, the `BUILD` configuration under `opt_dll/build_760` needs to include:

- `cc_import` to import `opt_dll/libVanJeeLaser760Filter_linux.so`
- `-DFILTER_DLL_ENABLE`
- Runtime `rpath` pointing to `../opt_dll` and `/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar`

These changes have already been applied in the current repository; no manual replacement is required.

### 1.3 Pre-start Check

Verify the following settings in `modules/drivers/lidar/vanjeelidar/conf/vanjeelidar.pb.txt`:

```yaml
model: "vanjee_760"
host_msop_port: 3002
host_address: "192.168.10.6"
lidar_address: "192.168.10.13"
max_distance: 260
wait_for_difop: false
```
